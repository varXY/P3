//
//  SameOrNotViewController.swift
//  P3
//
//  Created by 文川术 on 2/9/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SameOrNotViewController: TestViewController {

	var buttons = [UIButton]()

	override func viewDidLoad() {
		super.viewDidLoad()

		rightScore = 2
		wrongScore = -2

		headerView = HeaderView(number: 1, totalScore: totalScore)
		headerView.delegate = self
		self.view.addSubview(headerView)

		nextButton = NextButton()
		nextButton.delegate = self
		self.view.addSubview(nextButton)

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

		if !firstTime { chinese.getOneForSameOrNot() }
		let positionInPage = scrollView.frame.width * CGFloat(page)
		let buttonSize = CGSize(width: scrollView.frame.width - 40, height: 60)

		for i in 0..<2 {
			let blockWidth = BlockWidth.sameOrNot
			let gapWidth = (ScreenWidth - blockWidth * 2) / 3
			let point = CGPoint(x: positionInPage + gapWidth + (blockWidth + gapWidth) * CGFloat(i), y: (ScreenHeight / 2 - blockWidth) / 2)
			let blockView = BlockView(type: .SameOrNot, origin: point, text: chinese.forSameOrNot[i])
			blockViews.append(blockView)
			scrollView.addSubview(blockViews[blockViews.count - 1])

			let buttonY = ScreenHeight / 2
			let buttonOrigin = CGPoint(x: positionInPage + 20, y: buttonY + (buttonSize.height + 20) * CGFloat(i))
			let button = UIButton(type: .System)
			button.frame = CGRect(origin: buttonOrigin, size: buttonSize)
			button.backgroundColor = UIColor.clearColor()
			button.addTextLabel(Titles.sameOrNot[i], textColor: UIColor.whiteColor(), font: UIFont.buttonTitleFont(22), animated: true)
			button.changeColorWhenTouchDown(UIColor.whiteColor())
			button.addBorder(borderColor: UIColor.whiteColor(), width: 2.0)

			button.tag = 100 + i
			button.addTarget(self, action: #selector(SameOrNotViewController.sameOrNot(_:)), forControlEvents: .TouchUpInside)
			button.exclusiveTouch = true
			buttons.append(button)
			scrollView.addSubview(buttons[buttons.count - 1])

		}

	}

	override func removeContent() {
		blockViews[0].removeFromSuperview()
		blockViews[1].removeFromSuperview()
		buttons[0].removeFromSuperview()
		buttons[1].removeFromSuperview()
	}

	func sameOrNot(sender: UIButton) {
		for button in buttons { button.userInteractionEnabled = false }

		showRightOrWorng(sender)
		delay(seconds: 0.6) { self.allShowPinyin() }
		delay(seconds: 0.8) { self.addNextPageButton() }
		delay(seconds: 0.85) { self.currentPage += 1; self.addContent(page: self.currentPage, firstTime: false) }

	}

	func showRightOrWorng(sender: UIButton) {
		let ChosenSame = sender.tag == 100
		let trulySame = blockViews[blockViews.count - 2].text[0] == blockViews[blockViews.count - 1].text[0]

		if ChosenSame == trulySame {
			headerView.showAndAddScore(rightScore)
			if sound { rightSound.play() }
			for blockView in blockViews { blockView.allChangeColor(UIColor.rightGreen()) }
			sender.changeToColor(UIColor.rightGreen())

			for button in buttons {
				if button != sender {
					button.enabled = false
				}
			}


		} else {
			headerView.showAndAddScore(wrongScore)
			for blockView in blockViews { blockView.allChangeColor(UIColor.wrongRed()) }
			if sound { wrongSound.play() }
			if vibration { AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) }
			sender.changeColorBack()
			sender.enabled = false

			for button in buttons {
				if button != sender {
					button.changeToColor(UIColor.rightGreen())
				}
			}


		}

	}

	func allShowPinyin() {
		for blockView in blockViews { blockView.allShowPinyin() }
	}

	func addNextPageButton() {
		let title: NextButtonTitle = currentPage < 9 ? .Next : .Done
		nextButton.show(title, dismissAfterTapped: true)
	}

}


extension SameOrNotViewController: NextButtonDelegate {

	func nextButtonTapped(title: NextButtonTitle) {
		if currentPage < 10 {
			delay(seconds: Time.toNextPageWaitingTime, completion: {
				self.headerView.changeNumber(toNumber: self.currentPage + 1)
				self.jumpToPage(self.currentPage)
			})
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











