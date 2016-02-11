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

	var firstData = [[String]]()

	var chinese = Chinese()

	var titleLabel = UILabel()
	var blockViews = [BlockView]()
	var buttons = [UIButton]()
	var quitButton = UIButton()
	var nextButton = UIButton()

	var rightCount = 0


	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.deepGray()

		prepareScrollView(firstTime: true)

		titleLabel.frame.size = CGSize(width: 200, height: 60)
		titleLabel.frame.origin = CGPoint(x: 20, y: 5)
		titleLabel.textColor = UIColor.whiteColor()
		titleLabel.text = "1/10"
		self.view.addSubview(titleLabel)

		quitButton = UIButton(type: .InfoLight)
		quitButton.frame = CGRect(x: view.frame.width - 50, y: 20, width: 30, height: 30)
		quitButton.addTarget(self, action: "confirmToQuit", forControlEvents: .TouchUpInside)
		self.view.addSubview(quitButton)

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
		scrollView.delegate = self
		self.view.addSubview(scrollView)
		self.view.bringSubviewToFront(titleLabel)
		self.view.bringSubviewToFront(quitButton)

		currentPage = 0
		addContent(page: currentPage, firstTime: firstTime)
	}

	func addContent(page page: Int, firstTime: Bool) {

		var data = [[String]]()
		if firstTime {
			data = self.firstData
		} else {
			chinese.getOneForSameOrNot()
			data = chinese.forSameOrNot
		}


		let positionInPage = scrollView.frame.width * CGFloat(page)

		let buttonSize = CGSize(width: scrollView.frame.width - 40, height: 60)
		let buttonTitles = ["Same", "Different"]

		for i in 0..<2 {
			let blockWidth = (ScreenWidth - 60) / 2
			let point = CGPoint(x: positionInPage + 20 + (blockWidth + 20) * CGFloat(i), y: 60 + 20)
			let blockView = BlockView(type: .SameOrNot, origin: point, text: data[i])
			blockViews.append(blockView)
			scrollView.addSubview(blockViews[blockViews.count - 1])

			let buttonY = blockView.frame.origin.y + blockView.frame.height + 40
			let buttonOrigin = CGPoint(x: positionInPage + 20, y: buttonY + (buttonSize.height + 20) * CGFloat(i))
			let button = UIButton(type: .System)
			button.frame = CGRect(origin: buttonOrigin, size: buttonSize)
			button.backgroundColor = UIColor.whiteColor()
			button.setTitle(buttonTitles[i], forState: .Normal)
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

		nextButton.removeFromSuperview()

	}

	func sameOrNot(sender: UIButton) {
		for button in buttons { button.userInteractionEnabled = false }

		showRightOrWorng(sender)
		delay(seconds: 0.6) { self.showPinyin() }

		if currentPage < 9 {

			delay(seconds: 0.8) { self.addNextPageButton() }
			delay(seconds: 1.0) { self.currentPage++; self.addContent(page: self.currentPage, firstTime: false) }

		} else {

			delay(seconds: 1.5, completion: { () -> () in
				self.titleLabel.text = "完成"
				self.scrollView.removeFromSuperview()
			})

			delay(seconds: 2.5, completion: { () -> () in
				self.addCompletedPage()
				self.prepareScrollView(firstTime: false)
			})

		}


	}

	func showRightOrWorng(sender: UIButton) {
		let ChosenSame = sender.tag == 100
		let trulySame = blockViews[blockViews.count - 2].text[0] == blockViews[blockViews.count - 1].text[0]

		if ChosenSame == trulySame {
			rightCount++
			for blockView in blockViews { blockView.allChangeColor(true) }
			sender.backgroundColor = UIColor.greenColor()
			sender.tintColor = UIColor.whiteColor()

			for button in buttons {
				if button != sender {
					button.enabled = false
				}
			}

		} else {
			for blockView in blockViews { blockView.allChangeColor(false) }
			AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))

			sender.enabled = false

			for button in buttons {
				if button != sender {
					button.backgroundColor = UIColor.greenColor()
					button.tintColor = UIColor.whiteColor()
				}
			}

		}
	}

	func showPinyin() {
		for blockView in blockViews {
			blockView.showPinyin()
		}
	}

	func addNextPageButton() {
		nextButton = UIButton(type: .System)
		nextButton.frame.size = CGSize(width: 100, height: 100)
		let positionInPage = scrollView.frame.width * CGFloat(currentPage)
		nextButton.center = CGPoint(x: scrollView.frame.width / 2 + positionInPage, y: scrollView.frame.height - 70)
		nextButton.backgroundColor = UIColor.whiteColor()
		nextButton.setTitle("Next", forState: .Normal)
		nextButton.addTarget(self, action: "nextPage", forControlEvents: .TouchUpInside)
		nextButton.tag = 99

		scrollView.addSubview(nextButton)
	}

	func nextPage() {
		titleLabel.text = "\(currentPage + 1)/10"
		delay(seconds: 0.1) { self.jumpToPage(self.currentPage) }
	}

	func jumpToPage(page: Int) {
		let duration = Double(scrollView.frame.width / 640)

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
			}, completion: {(_) -> Void in
				self.removeContent()
		})

	}

	func addCompletedPage() {
		let contentView = UIView(frame: CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height - 60))
		contentView.backgroundColor = UIColor.clearColor()
		contentView.tag = 110
		self.view.addSubview(contentView)

		let resultLabel = UILabel(frame: CGRect(x: 0, y: 60, width: contentView.frame.width, height: 60))
		resultLabel.textAlignment = .Center
		resultLabel.textColor = UIColor.whiteColor()
		resultLabel.font = UIFont.boldSystemFontOfSize(22)
		resultLabel.text = "共答对了\(rightCount)题"
		contentView.addSubview(resultLabel)

		let titles = ["Again", "Quit"]

		for i in 0..<2 {
			let button = UIButton(type: .System)
			button.frame = CGRect(x: 20, y: (contentView.frame.height - 160) + 80 * CGFloat(i), width: contentView.frame.width - 40, height: 60)
			button.backgroundColor = UIColor.whiteColor()
			button.setTitle(titles[i], forState: .Normal)
			button.addTarget(self, action: "finalChoice:", forControlEvents: .TouchUpInside)
			button.exclusiveTouch = true
			button.tag = 120 + i
			contentView.addSubview(button)
		}


	}


	func finalChoice(sender: UIButton) {
		let again = sender.tag == 120

		if again {
			self.titleLabel.text = "1/10"
			self.rightCount = 0

			if let contentView = self.view.viewWithTag(110) {

				UIView.animateWithDuration(0.4, animations: { () -> Void in
					contentView.alpha = 0.0
					self.scrollView.frame.origin.x -= self.view.frame.width
					}, completion: { (_) -> Void in
						contentView.removeFromSuperview()
				})

			}

		} else {
			confirmToQuit()
		}
	}

	func confirmToQuit() {
//		scrollView.removeFromSuperview()
		self.navigationController?.popViewControllerAnimated(true)
	}


}


extension SameOrNotViewController: UIScrollViewDelegate {


}