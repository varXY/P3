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


	override func viewDidLoad() {
		super.viewDidLoad()

		rightScore = 3
		wrongScore = -3

		headerView = HeaderView(number: 1, totalScore: totalScore)
		headerView.delegate = self
		view.addSubview(headerView)

		nextButton = NextButton()
		nextButton.delegate = self
		view.addSubview(nextButton)

		prepareScrollView(firstTime: true)

	}

	func prepareScrollView(firstTime firstTime: Bool) {
		scrollView = UIScrollView(frame: view.bounds)
		scrollView.frame.origin.x += firstTime ? 0 : view.frame.width
		setUpScrollView()

		currentPage = 0
		addContent(page: currentPage, firstTime: firstTime)
	}

	func addContent(page page: Int, firstTime: Bool) {

		if !firstTime { chinese.getSixForSelectTheSame_1() }
		rightAnswer = chinese.forSelectTheSame[0][0]

		let positionInPage = scrollView.frame.width * CGFloat(page)
		let indexs = getRandomNumbers(6, lessThan: 6)

		for i in 0..<6 {
			let margin = (ScreenWidth - BlockWidth.selectTheSame * 2) / 3
			let x = positionInPage + margin + (BlockWidth.selectTheSame + margin) * CGFloat(i % 2)
			let y = blockY(i)

			let blockView = BlockView(type: .SelectTheSame, origin: CGPoint(x: x, y: y), text: chinese.forSelectTheSame[indexs[i]])
			blockView.delegate = self
			blockViews.append(blockView)
			scrollView.addSubview(blockViews[blockViews.count - 1])
		}

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
		for i in 0..<5 {
			blockViews[i].removeFromSuperview()
		}
	}

	func showRightOrWrong() {
		let allTheSame = selectedBlocks.filter({ $0[0] == rightAnswer })
		let right = allTheSame.count == 3 && selectedBlocks.count == 3
		let color: ColorType = right ? .Green : .Red
		let score = right ? rightScore : wrongScore
		if sound { right ? rightSound.play() : wrongSound.play() }
		if vibration && !right { AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) }

		delay(seconds: 0.1, completion: { self.headerView.showAndAddScore(score) })

		for blockView in blockViews {
			blockView.setSelectable(false)
			blockView.allChangeColor(color)

			delay(seconds: 0.6, completion: {
				blockView.showAllPinyin()
				if blockView.text[0] == self.rightAnswer { blockView.showGreenBorder() }
			})

		}

		selectedBlocks.removeAll()
	}

}


extension SelectTheSameViewController: BlockViewDelegate {

	func blockViewSelected(selected: Bool, blockText: [String]) {

		if selected {
			selectedBlocks.append(blockText)
		} else {
			let text = blockText[1]
			selectedBlocks = selectedBlocks.filter({ $0[1] != text })
		}

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
					self.currentPage++
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



