//
//  SelectTheSameViewController.swift
//  P3
//
//  Created by 文川术 on 2/10/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class SelectTheSameViewController: TestViewController {

	var rightAnswer = String()
	var answerShowed = false
	var selectedBlocks = [[String]]()

	var selectedCharacterIndexes = [Int]()
	var lianLianKan: LianLianKan!

	override func viewDidLoad() {
		super.viewDidLoad()
		rightScore = 3
		wrongScore = -3

		headerView = HeaderView(index: ScreenHeight == 480 ? 10 : 11, totalScore: totalScore)
		headerView.delegate = self
		view.addSubview(headerView)

		if ScreenHeight == 480 {
			nextButton = NextButton()
			nextButton.delegate = self
			view.addSubview(nextButton)

			prepareScrollView(firstTime: true)
		} else {
			lianLianKan = LianLianKan(content: chinese.selectTheSame60Characters, VC: self)
		}

	}

	func prepareScrollView(firstTime firstTime: Bool) {
		scrollView = UIScrollView(frame: view.bounds)
		scrollView.frame.origin.x += firstTime ? 0 : view.frame.width
		setUpScrollView()

		currentPage = 0
		addContent(page: currentPage, firstTime: firstTime)
	}

	func addContent(page page: Int, firstTime: Bool) {
		if !firstTime { chinese.getSixForSelectTheSame() }
		rightAnswer = chinese.forSelectTheSame[0][0]

		let positionInPage = scrollView.frame.width * CGFloat(page)
		let indexes = getRandomNumbers(6, lessThan: 6)
		blockViews += indexes.map({
			let i = indexes.indexOf($0)!
			let margin = (ScreenWidth - BlockWidth.selectTheSame * 2) / 3
			let x = positionInPage + margin + (BlockWidth.selectTheSame + margin) * CGFloat(i % 2)
			let y = blockY(i)

			let blockView = BlockView(type: .SelectTheSame, origin: CGPoint(x: x, y: y), text: chinese.forSelectTheSame[indexes[i]])
			blockView.delegate = self
			scrollView.addSubview(blockView)
			return blockView
		})

	}

	func blockY(number: Int) -> CGFloat {
		let initalY: CGFloat = ScreenHeight == 480 ? 50 : 90
		let margin: CGFloat = ScreenHeight == 480 ? 10 : 30
		switch number {
		case 0, 1:
			return initalY
		case 2, 3:
			return initalY + BlockWidth.selectTheSame + margin
		case 4, 5:
			return initalY + (BlockWidth.selectTheSame + margin) * 2
		default:
			return initalY
		}
	}

	override func removeContent() {
		if ScreenHeight == 480 {
			blockViews.forEach({ if blockViews.indexOf($0) < 6 { $0.removeFromSuperview() } })
		} else {
			lianLianKan = LianLianKan(content: chinese.selectTheSame60Characters, VC: self)
			delay(seconds: 0.3, completion: { self.headerView.centerLabel.removeFromSuperview() })
			delay(seconds: 1.0, completion: {
				self.headerView.centerLabel.text = ""
				self.headerView.centerLabel.alpha = 1.0
				self.headerView.addSubview(self.headerView.centerLabel)
			})
		}

	}

	func showRightOrWrong() {
		let allTheSame = selectedBlocks.filter({ $0[0] == rightAnswer })
		let right = allTheSame.count == 3 && selectedBlocks.count == 3
		let color: UIColor = right ? UIColor.colorWithValues(MyColors.P_rightGreen) : UIColor.colorWithValues(MyColors.P_wrongRed)
		let score = right ? rightScore : wrongScore
		headerView.showAndAddScore(score)
		if sound { right ? rightSound.play() : wrongSound.play() }
		if vibration && !right { AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) }

		blockViews.forEach({
			$0.setSelectable(false)
			$0.allChangeColor(color)
			if $0.text[0] == self.rightAnswer { $0.showGreenBorder() }
		})

		selectedBlocks.removeAll()
	}

}

extension SelectTheSameViewController: LittleTouchDownAndUp {

	func touchDown(sender: UIButton) {
		sender.backgroundColor = UIColor.whiteColor()
		sender.tintColor = UIColor.colorWithValues(MyColors.P_darkBlue)
	}

	func touchUpOutside(sender: UIButton) {
		sender.backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
		sender.tintColor = UIColor.whiteColor()
	}

	func touchUpInside(sender: UIButton) {
		selectedCharacterIndexes.append(sender.tag - 200)

		if selectedCharacterIndexes.count == 2 {
			if chinese.selectTheSame60Pinyins[selectedCharacterIndexes[0]] == chinese.selectTheSame60Pinyins[selectedCharacterIndexes[1]] && selectedCharacterIndexes[0] != selectedCharacterIndexes[1] {
				headerView.changeCenterLabelTitle(chinese.selectTheSame60Pinyins[selectedCharacterIndexes[1]], backToNil: true)
				lianLianKan.buttons[selectedCharacterIndexes[0]].removeFromSuperview()
				lianLianKan.buttons[selectedCharacterIndexes[1]].removeFromSuperview()
				headerView.showAndAddScore(rightScore)
				if sound { rightSound.play() }

				delay(seconds: 0.8, completion: { self.checkTestCompleteOrNot() })
			} else {
				lianLianKan.buttons[selectedCharacterIndexes[0]].backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
				lianLianKan.buttons[selectedCharacterIndexes[0]].tintColor = UIColor.whiteColor()
				lianLianKan.buttons[selectedCharacterIndexes[1]].backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
				lianLianKan.buttons[selectedCharacterIndexes[1]].tintColor = UIColor.whiteColor()
				headerView.showAndAddScore(wrongScore)
				if sound { wrongSound.play() }
				if vibration { AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) }
			}

			selectedCharacterIndexes.removeAll()
		}
	}

	func checkTestCompleteOrNot() {
		if view.subviews.count == 2 {
			chinese.get60CharactersForSelectTheSame()
			self.view.bringSubviewToFront(self.finalView)
			self.finalView.show(self.headerView.currentScore, delay: 0.5)

			let score = Score(score: self.headerView.currentScore, time: NSDate())
			self.sendBackScore(totalScore: self.headerView.totalScore, newScore: score)
		}
	}


}


extension SelectTheSameViewController: BlockViewDelegate {

	func blockViewSelected(selected: Bool, blockText: [String]) {
		selectedBlocks = selected ? selectedBlocks + [blockText] : selectedBlocks.filter({ $0[1] != blockText[1] })

		if selectedBlocks.count > 2 && nextButton.titleType != .Confirm {
			nextButton.show(.Confirm, dismissAfterTapped: false)
		}

		if selectedBlocks.count < 3 && nextButton.titleType == .Confirm {
			nextButton.hide()
		}

	}

	func answerShowedByQuestionMark() {
	}
}


extension SelectTheSameViewController: NextButtonDelegate {

	func nextButtonTapped(title: NextButtonTitle) {
		
		if currentPage < 10 {

			if title == .Confirm {
				showRightOrWrong()

				delay(seconds: 0.8, completion: {
					let nextTitle: NextButtonTitle = self.currentPage == 9 ? .Done : .Next
					self.nextButton.changeTitle(nextTitle, dismissAfterTapped: true)
				})

				delay(seconds: 0.85, completion: {
					self.currentPage += 1
					self.addContent(page: self.currentPage, firstTime: false)
				})

			}

			if title == .Next {
				delay(seconds: Time.toNextPageWaitingTime, completion: {
					self.headerView.changeNumber(toNumber: self.currentPage + 1)
					self.jumpToPage(self.currentPage)
				})

			}

		} else {
			UIView.animateWithDuration(0.3, animations: { () -> Void in
				self.scrollView.alpha = 0.0
				}, completion: { (_) -> Void in
					self.headerView.showAllNumbers()
					self.scrollView.removeFromSuperview()
					self.view.bringSubviewToFront(self.finalView)
					self.finalView.show(self.headerView.currentScore, delay: 0.5)
					self.prepareScrollView(firstTime: false)

					let score = Score(score: self.headerView.currentScore, time: NSDate())
					self.sendBackScore(totalScore: self.headerView.totalScore, newScore: score)
			})
		}

	}
}



