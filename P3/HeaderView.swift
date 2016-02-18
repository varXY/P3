//
//  HeaderView.swift
//  P3
//
//  Created by 文川术 on 2/14/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit


protocol HeaderViewDelegate: class {
	func backButtonTapped()
}

class HeaderView: UIView {

	var page = 0
	var pageLabel = UILabel()
	var showedNumberLabel = UILabel()
	var showedNumber = 0
	var numberColors = [UIColor]()

	var totalScore = 0
	var currentScore = 0
	var scoreLabel = UILabel()

	var centerLabel: UILabel!

	let titles = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十"]

	weak var delegate: HeaderViewDelegate?

	init(number: Int, totalScore: Int) {
		super.init(frame: CGRect(x: 2, y: 2, width: ScreenWidth - 4, height: 60))
		backgroundColor = UIColor.clearColor()
//		addBorder(borderColor: UIColor.whiteColor())
		self.totalScore = totalScore
		showedNumber = page

		addBackButton(CGRect(x: -10, y: 0, width: 60, height: frame.height))
		addScoreLabel(CGRect(x: frame.width - 55, y: 0, width: 60, height: frame.height))
		addOneToTenLabels()
		addcenterLabel(1, frame: CGRect(x: (frame.width - 60) / 2, y: 0, width: 60, height: frame.height))
	}


	// MARK: - Add Contents

	func addBackButton(frame: CGRect) {
		let backButton = UIButton(type: .System)
		backButton.tintColor = UIColor.whiteColor()
		backButton.frame = frame
		backButton.setImage(UIImage(named: ImageName.Back), forState: .Normal)
		backButton.addTarget(self, action: "backButtonTapped", forControlEvents: .TouchUpInside)
		backButton.exclusiveTouch = true
		addSubview(backButton)
	}


	func addOneToTenLabels() {
		let littleLabelWidth = (frame.width - 120) / 10
		for i in 0..<10 {
			let frame = CGRect(x: 60 + littleLabelWidth * CGFloat(i), y: 0, width: littleLabelWidth, height: self.frame.height)
			let label = UILabel(frame: frame)
			label.text = titles[i]
			label.textAlignment = .Center
			label.textColor = UIColor.whiteColor()
			label.adjustsFontSizeToFitWidth = true
			label.tag = 123456789 + i
			addSubview(label)

			label.alpha = 0.0

		}
	}

	func addScoreLabel(frame: CGRect) {
		scoreLabel = UILabel(frame: frame)
		scoreLabel.textColor = UIColor.whiteColor()
		scoreLabel.textAlignment = .Center
		scoreLabel.font = UIFont.scoreFont(17)
		scoreLabel.text = "\(totalScore)"
		self.addSubview(scoreLabel)
	}

	func addcenterLabel(number: Int, frame: CGRect) {
		let label = UILabel(frame: frame)
		label.backgroundColor = UIColor.clearColor()
		label.textColor = UIColor.themeGold()
		label.textAlignment = .Center
		label.font = UIFont.systemFontOfSize(18)
		label.text = titles[number - 1]
		centerLabel = label
		addSubview(centerLabel)
	}


	// MARK: - Functions

	func changeNumber(toNumber toNumber: Int) {
//		hideNumberLabel(showedNumber, textColor: UIColor.whiteColor())
//		showNumberLabel(toNumber, textColor: UIColor.whiteColor())
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			self.centerLabel.alpha = 0.0
			}) { (_) -> Void in
				self.centerLabel.text = self.titles[toNumber - 1]

				UIView.animateWithDuration(0.3, animations: { () -> Void in
					self.centerLabel.alpha = 1.0
				})
		}
	}

	func showAllNumbers() {
		UIView.animateWithDuration(0.3) { () -> Void in
			self.centerLabel.alpha = 0.0
		}

		delay(seconds: 0.3) { () -> () in
			for i in 0..<10 {
				delay(seconds: 0.05 * Double(i), completion: { () -> () in
					self.showNumberLabel(i + 1, textColor: self.numberColors[i])
				})
			}
		}

	}

	func showAndAddScore(number: Int) {
		currentScore += number
		scoreLabel.text = ""
		let numberForShow = number > 0 ? "+" + "\(number)" : "\(number)"
		let textColor = number > 0 ? UIColor.greenColor() : UIColor.redColor()
		numberColors.append(textColor)

		delay(seconds: 0.2) { () -> () in
			UIView.animateWithDuration(0.5, animations: { () -> Void in
				self.scoreLabel.textColor = textColor
				self.scoreLabel.text = numberForShow
			})
		}

		delay(seconds: 1.0) { () -> () in
			self.scoreLabel.text = ""

			UIView.animateWithDuration(0.5, animations: { () -> Void in
				self.totalScore += number
				self.scoreLabel.textColor = UIColor.whiteColor()
				self.scoreLabel.text = "\(self.totalScore)"
			})
		}
	}

	func startAllOver() {
		currentScore = 0
		numberColors.removeAll()

		for i in 0..<10 {
			delay(seconds: 0.05 * Double(i), completion: { () -> () in
				self.hideNumberLabel(i + 1, textColor: UIColor.whiteColor())
			})

//			delay(seconds: 0.5, completion: { () -> () in
//				self.showNumberLabel(1, textColor: UIColor.whiteColor())
//			})
		}

		delay(seconds: 0.3, completion: { self.changeNumber(toNumber: 1) })
	}


	// MARK: Local Functions

	func showNumberLabel(number: Int, textColor: UIColor) {
		if let label = self.viewWithTag(123456789 + number - 1) as? UILabel {
			showedNumberLabel = label
			showedNumber = number
			UIView.animateWithDuration(0.3, animations: { () -> Void in
				label.textColor = textColor
				label.alpha = 1.0
			})
		}
	}

	func hideNumberLabel(number: Int, textColor: UIColor) {
		if let label = self.viewWithTag(123456789 + number - 1) as? UILabel {
			UIView.animateWithDuration(0.3, animations: { () -> Void in
				label.alpha = 0.0
				label.textColor = textColor
			})
		}
	}

	func backButtonTapped() {
		delegate?.backButtonTapped()
	}

//	func changePage(toPage: Int) {
//		pageLabel.text = "\(toPage) / 10"
//	}
//
//	func pageToTitle(title: String) {
//		pageLabel.text = title
//	}
//


	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}