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

		headerView = HeaderView(index: 0, totalScore: totalScore)
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
		if !firstTime { chinese.getOneForSameOrNot() }
		let positionInPage = scrollView.frame.width * CGFloat(page)
		let buttonSize = CGSize(width: scrollView.frame.width - 40, height: 60)
		let indexes = [0, 1]

		blockViews += indexes.map({
			let blockWidth = BlockWidth.sameOrNot
			let gapWidth = (ScreenWidth - blockWidth * 2) / 3
			let point = CGPoint(x: positionInPage + gapWidth + (blockWidth + gapWidth) * CGFloat($0), y: (ScreenHeight / 2 - blockWidth) / 2)
			let blockView = BlockView(type: .SameOrNot, origin: point, text: chinese.forSameOrNot[$0])
			scrollView.addSubview(blockView)
			return blockView
		})

		buttons += indexes.map({
			let buttonY = ScreenHeight / 2
			let buttonOrigin = CGPoint(x: positionInPage + 20, y: buttonY + (buttonSize.height + 20) * CGFloat($0))
			let button = UIButton(type: .System)
			button.frame = CGRect(origin: buttonOrigin, size: buttonSize)
			button.backgroundColor = UIColor.clearColor()
			button.addTextLabel(Titles.sameOrNot[$0], textColor: UIColor.whiteColor(), font: UIFont.buttonTitleFont(22), animated: true)
			button.changeColorWhenTouchDown(UIColor.whiteColor())
			button.addBorder(borderColor: UIColor.whiteColor(), width: 2.0)

			button.tag = 100 + $0
			button.addTarget(self, action: #selector(SameOrNotViewController.sameOrNot(_:)), forControlEvents: .TouchUpInside)
			button.exclusiveTouch = true
			scrollView.addSubview(button)
			return button
		})

	}

	override func removeContent() {
		blockViews[0].removeFromSuperview()
		blockViews[1].removeFromSuperview()
		buttons[0].removeFromSuperview()
		buttons[1].removeFromSuperview()
	}

	func sameOrNot(sender: UIButton) {
		buttons.forEach({ $0.userInteractionEnabled = false })
		showRightOrWorng(sender)
		delay(seconds: 0.6) { self.blockViews.forEach({ $0.allShowPinyin() }) }
		delay(seconds: 0.8) { self.nextButton.show(self.currentPage < 9 ? .Next : .Done, dismissAfterTapped: true) }
		delay(seconds: 0.85) { self.currentPage += 1; self.addContent(page: self.currentPage, firstTime: false) }
	}

	func showRightOrWorng(sender: UIButton) {
		let ChosenSame = sender.tag == 100
		let trulySame = blockViews[blockViews.count - 2].text[0] == blockViews[blockViews.count - 1].text[0]

		if ChosenSame == trulySame {
			headerView.showAndAddScore(rightScore)
			if sound { promptSound.play(true, sound: promptSound.right_sound) }
			blockViews.forEach({ $0.allChangeColor(UIColor.colorWithValues(MyColors.P_rightGreen)) })
			sender.changeToColor(UIColor.colorWithValues(MyColors.P_rightGreen))
			buttons.forEach({ if $0 != sender { $0.enabled = false }})

		} else {
			headerView.showAndAddScore(wrongScore)
			blockViews.forEach({ $0.allChangeColor(UIColor.colorWithValues(MyColors.P_wrongRed)) })
			if sound { promptSound.play(true, sound: promptSound.wrong_sound) }
			if vibration { AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) }
			sender.changeColorBack()
			sender.enabled = false
			buttons.forEach({ if $0 != sender { $0.changeToColor(UIColor.colorWithValues(MyColors.P_rightGreen)) } })
		}

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











