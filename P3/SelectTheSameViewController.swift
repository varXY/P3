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

	let chinese = Chinese()
	var rightAnswer = String()
	var rightCount = 0
	var answerShowed = false

	var firstData = [[String]]()
	
	var titleLabel = UILabel()
	var blockViews = [BlockView]()
	var quitButton = UIButton()
	var confirmButtons = [UIButton]()

	var selectedBlocks = [[String]]()

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
			chinese.getSixForSelectTheSame_1()
			data = chinese.forSelectTheSame
		}

		rightAnswer = data[0][0]
		print(rightAnswer)

		let positionInPage = scrollView.frame.width * CGFloat(page)
		let indexs = getRandomNumbers(6, lessThan: 6)

		for i in 0..<6 {
			let x = positionInPage + 30 + ((self.view.frame.width - 90) / 2 + 30) * CGFloat(i % 2)
			let y = blockY(i)

			let blockView = BlockView(type: .SelectTheSame, origin: CGPoint(x: x, y: y), text: data[indexs[i]])
			blockView.delegate = self
			blockViews.append(blockView)
			scrollView.addSubview(blockViews[blockViews.count - 1])
		}

		let confirmButton = UIButton(type: .System)
		confirmButton.frame = CGRect(x: positionInPage + 30, y: blockY(6), width: self.view.frame.width - 60, height: 60)
		confirmButton.backgroundColor = UIColor.whiteColor()
		confirmButton.setTitle("Confirm", forState: .Normal)
		confirmButton.addTarget(self, action: "confirm:", forControlEvents: .TouchUpInside)
		confirmButton.exclusiveTouch = true
		confirmButton.enabled = false

		confirmButtons.append(confirmButton)
		scrollView.addSubview(confirmButtons[confirmButtons.count - 1])
	}

	func blockY(number: Int) -> CGFloat {
		switch number {
		case 0, 1:
			return 60
		case 2, 3:
			return 60 + (self.view.frame.width - 90) / 2 + 30
		case 4, 5:
			return 60 + ((self.view.frame.width - 90) / 2 + 30) * 2
		case 6:
			return 60 + ((self.view.frame.width - 90) / 2 + 30) * 3 - 10
		default:
			return 60
		}
	}

	func removeContent() {

		for i in 0..<5 {
			blockViews[i].removeFromSuperview()
		}

		confirmButtons[0].removeFromSuperview()
		
	}

	func confirm(sender: UIButton) {
		sender.enabled = false

		if !answerShowed {
			answerShowed = true
			showRightOrWrong()

			delay(seconds: 0.7, completion: { () -> () in
				self.currentPage++
				self.addContent(page: self.currentPage, firstTime: false)

				sender.setTitle("Next", forState: .Normal)
				sender.enabled = true
			})

		} else {
			answerShowed = false

			if currentPage != 10 {
				titleLabel.text = "\(currentPage + 1)/10"
				jumpToPage(currentPage)
			} else {

				UIView.animateWithDuration(0.5, animations: { () -> Void in
					self.scrollView.removeFromSuperview()

					}, completion: { (_) -> Void in
						self.titleLabel.text = "完成"
						self.addCompletedPage()

						delay(seconds: 0.2, completion: { () -> () in
							self.prepareScrollView(firstTime: false)
						})
				})
			}

		}



	}

	func showRightOrWrong() {
		print(selectedBlocks)
		let allTheSame = selectedBlocks.filter({ $0[0] == rightAnswer })
		print(allTheSame)
		
		if allTheSame.count == 3 && selectedBlocks.count == 3 {
			rightCount++

			for blockView in blockViews {
				blockView.setSelectable(false)
				blockView.allChangeColor(.Green)
				delay(seconds: 0.5, completion: {
					blockView.showAllPinyin()
					if blockView.text[0] == self.rightAnswer { blockView.showGreenBorder() }
				})
			}

		} else {
			for blockView in blockViews {
				blockView.setSelectable(false)
				blockView.allChangeColor(.Red)
				delay(seconds: 0.5, completion: {
					blockView.showAllPinyin()
					if blockView.text[0] == self.rightAnswer { blockView.showGreenBorder() }
				})
			}
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

		if selectedBlocks.count > 1 {
			for button in confirmButtons { button.enabled = true }
		}

	}
}









