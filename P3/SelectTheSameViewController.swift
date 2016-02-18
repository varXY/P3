//
//  SelectTheSameViewController.swift
//  P3
//
//  Created by 文川术 on 2/10/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit

class SelectTheSameViewController: UIViewController {

	var scrollView = UIScrollView()
	var currentPage = 0

	var chinese: Chinese!
	var rightAnswer = String()
	var rightCount = 0
	var answerShowed = false

	var blockViews = [BlockView]()

	var nextButton: NextButton!
	var headerView: HeaderView!

	var selectedBlocks = [[String]]()

	var totalScore = Int()
	let rightScore = 3
	let wrongScore = -3

	var sendBackScore: ((totalScore: Int, newScore: Score) -> Void)!

	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.deepGray()

		headerView = HeaderView(number: 1, totalScore: totalScore)
		headerView.delegate = self
		self.view.addSubview(headerView)

		nextButton = NextButton()
		nextButton.delegate = self
		self.view.addSubview(nextButton)

		prepareScrollView(firstTime: true)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)
	}

	func prepareScrollView(firstTime firstTime: Bool) {
		let frame = firstTime ? self.view.bounds : CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
		scrollView = UIScrollView(frame: frame)
		scrollView.contentSize = CGSize(width: scrollView.frame.width * 10, height: scrollView.frame.height)
		scrollView.backgroundColor = UIColor.deepGray()
		scrollView.pagingEnabled = true
		scrollView.scrollEnabled = false
		self.view.addSubview(scrollView)
		self.view.bringSubviewToFront(headerView)
		self.view.bringSubviewToFront(nextButton)

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
			let x = positionInPage + (ScreenWidth - BlockWidth.selectTheSame * 2) / 3 + (BlockWidth.selectTheSame + margin) * CGFloat(i % 2)
			let y = blockY(i)

			let blockView = BlockView(type: .SelectTheSame, origin: CGPoint(x: x, y: y), text: chinese.forSelectTheSame[indexs[i]])
			blockView.delegate = self
			blockViews.append(blockView)
			scrollView.addSubview(blockViews[blockViews.count - 1])
		}

	}

	func blockY(number: Int) -> CGFloat {
		switch number {
		case 0, 1:
			return 90
		case 2, 3:
			return 90 + (self.view.frame.width - 90) / 2 + 30
		case 4, 5:
			return 90 + ((self.view.frame.width - 90) / 2 + 30) * 2
		default:
			return 90
		}
	}

	func removeContent() {
		for i in 0..<5 {
			blockViews[i].removeFromSuperview()
		}
	}

	func showRightOrWrong() {
		let allTheSame = selectedBlocks.filter({ $0[0] == rightAnswer })
		let right = allTheSame.count == 3 && selectedBlocks.count == 3
		let color: ColorType = right ? .Green : .Red
		let score = right ? rightScore : wrongScore

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

	func jumpToPage(page: Int) {
		let duration = Double(scrollView.frame.width / 640)

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
			}, completion: {(_) -> Void in
				self.removeContent()
		})

	}


	func confirmToQuit() {
		self.navigationController?.popViewControllerAnimated(true)
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
}


extension SelectTheSameViewController: HeaderViewDelegate {

	func backButtonTapped() {
		if currentPage != 0 && currentPage != 10 {
			alertOfStayOrQuit(self, title: "Sure to Quit?", message: "If you quit, current scores will lose.", quit: { self.confirmToQuit() })
		} else {
			navigationController?.popToRootViewControllerAnimated(true)
		}
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
			headerView.showAllNumbers()

			let score = self.headerView.currentScore >= 0 ? "+" + "\(headerView.currentScore)" : "\(headerView.currentScore)"
			let finalView = FinalView(title: "共答对了\(rightCount)题\n总分" + score)
			finalView.delegate = self
			self.view.addSubview(finalView)

			UIView.animateWithDuration(0.5, animations: { () -> Void in
				self.scrollView.alpha = 0.0
				}, completion: { (_) -> Void in
					self.scrollView.removeFromSuperview()
					finalView.show()
					self.prepareScrollView(firstTime: false)

					let score = Score(score: self.headerView.currentScore, time: NSDate())
					self.sendBackScore(totalScore: self.headerView.totalScore, newScore: score)
			})
		}

	}
}


extension SelectTheSameViewController: FinalViewDelegate {

	func finalViewButtonTapped(buttonType: FinalViewButtonType) {

		if buttonType == .Again {
			headerView.startAllOver()
			rightCount = 0

			UIView.animateWithDuration(0.5, animations: {
				self.scrollView.frame.origin.x -= self.view.frame.width
			})

		} else {
			self.confirmToQuit()
		}
	}
}


