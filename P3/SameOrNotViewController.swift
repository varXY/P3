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

class SameOrNotViewController: UIViewController {

	var scrollView = UIScrollView()
	var currentPage = 0

	var chinese = Chinese()

	var blockViews = [BlockView]()
	var buttons = [UIButton]()
	var nextButton: NextButton!
	var headerView: HeaderView!

	var rightCount = 0

	var totalScore = 0
	let rightScore = 2
	let wrongScore = -2

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

		if !firstTime { chinese.getOneForSameOrNot() }
		let positionInPage = scrollView.frame.width * CGFloat(page)
		let buttonSize = CGSize(width: scrollView.frame.width - 40, height: 60)

		for i in 0..<2 {
			let blockWidth = (ScreenWidth - 60) / 2
			let point = CGPoint(x: positionInPage + 20 + (blockWidth + 20) * CGFloat(i), y: (ScreenHeight / 2 - blockWidth) / 2)
			let blockView = BlockView(type: .SameOrNot, origin: point, text: chinese.forSameOrNot[i])
			blockViews.append(blockView)
			scrollView.addSubview(blockViews[blockViews.count - 1])

			let buttonY = ScreenHeight / 2
			let buttonOrigin = CGPoint(x: positionInPage + 20, y: buttonY + (buttonSize.height + 20) * CGFloat(i))
			let button = UIButton(type: .System)
			button.frame = CGRect(origin: buttonOrigin, size: buttonSize)
			button.backgroundColor = UIColor.clearColor()
			button.addTextLabel(Titles.sameOrNot[i], textColor: UIColor.whiteColor(), font: UIFont.buttonTitleFont(22), animated: true)
			button.changeColorWhenTouchDown()
			button.addBorder(borderColor: UIColor.whiteColor(), width: 2.0)

			button.tag = 100 + i
			button.addTarget(self, action: "sameOrNot:", forControlEvents: .TouchUpInside)
			button.exclusiveTouch = true
			buttons.append(button)
			scrollView.addSubview(buttons[buttons.count - 1])

		}

	}

	func removeContent() {
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
		delay(seconds: 0.85) { self.currentPage++; self.addContent(page: self.currentPage, firstTime: false) }

	}

	func showRightOrWorng(sender: UIButton) {
		let ChosenSame = sender.tag == 100
		let trulySame = blockViews[blockViews.count - 2].text[0] == blockViews[blockViews.count - 1].text[0]

		if ChosenSame == trulySame {
			rightCount++
			for blockView in blockViews { blockView.allChangeColor(.Green) }
			sender.changeToColor(UIColor.rightGreen())

			for button in buttons {
				if button != sender {
					button.enabled = false
				}
			}
			delay(seconds: 0.1, completion: { self.headerView.showAndAddScore(self.rightScore) })


		} else {
			
			for blockView in blockViews { blockView.allChangeColor(.Red) }
			AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
			sender.changeColorBack()
			sender.enabled = false

			for button in buttons {
				if button != sender {
					button.changeToColor(UIColor.rightGreen())
				}
			}

			delay(seconds: 0.1, completion: { self.headerView.showAndAddScore(self.wrongScore) })

		}
	}

	func allShowPinyin() {
		for blockView in blockViews {
			blockView.showAllPinyin()
		}
	}

	func addNextPageButton() {
		let title: NextButtonTitle = currentPage < 9 ? .Next : .Done
		nextButton.show(title, dismissAfterTapped: true)
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


extension SameOrNotViewController: HeaderViewDelegate {

	func backButtonTapped() {
		if currentPage != 0 && currentPage != 10 {
			alertOfStayOrQuit(self, title: "Sure to Quit?", message: "If you quit, current scores will lose.", quit: { self.confirmToQuit() })
		} else {
			navigationController?.popToRootViewControllerAnimated(true)
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
			headerView.showAllNumbers()

			let score = self.headerView.currentScore >= 0 ? "+" + "\(headerView.currentScore)" : "\(headerView.currentScore)"
			let finalView = FinalView(title: "共答对了\(rightCount)题\n总分" + score)
			finalView.delegate = self
			view.addSubview(finalView)

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

extension SameOrNotViewController: FinalViewDelegate {

	func finalViewButtonTapped(buttonType: FinalViewButtonType) {

		if buttonType == .Again {
			headerView.startAllOver()
			rightCount = 0

			UIView.animateWithDuration(0.5, animations: { () -> Void in
				self.scrollView.frame.origin.x -= self.view.frame.width
			})

		} else {
			confirmToQuit()
		}
	}
}









