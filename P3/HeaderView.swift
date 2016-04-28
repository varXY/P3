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

	init(index: Int, totalScore: Int) {
		super.init(frame: CGRect(x: 2, y: 2, width: ScreenWidth - 4, height: 60))
		backgroundColor = UIColor.clearColor()
		self.totalScore = totalScore
		showedNumber = page

		addBackButton(CGRect(x: -15, y: 0, width: 60, height: frame.height))
		addcenterLabel(1, frame: CGRect(x: (frame.width - 60) / 2, y: 0, width: 60, height: frame.height))

		if index != 21 {
			addScoreLabel(CGRect(x: frame.width - 70, y: 0, width: 60, height: frame.height))
			addOneToTenLabels()
		}

		if index == 21 {
			centerLabel.frame = CGRect(x: frame.width - 70, y: 0, width: 60, height: frame.height)
			centerLabel.textAlignment = .Right
			centerLabel.text = "pin"
		}

		if index == 11 {
			centerLabel.text = ""
		}
	}


	// MARK: - Add Contents

	func addBackButton(frame: CGRect) {
		let backButton = UIButton(type: .System)
		backButton.tintColor = UIColor.whiteColor()
		backButton.frame = frame
		backButton.setImage(UIImage(named: ImageName.Back), forState: .Normal)
		backButton.addTarget(self, action: #selector(backButtonTapped), forControlEvents: .TouchUpInside)
		backButton.exclusiveTouch = true
		addSubview(backButton)
	}


	func addOneToTenLabels() {
		let littleLabelWidth = (frame.width - 120) / 10
		let indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
		let frames = indexes.map({ CGRect(x: 60 + littleLabelWidth * CGFloat($0), y: 0, width: littleLabelWidth, height: frame.height) })
		let labels = frames.map({ UILabel(frame: $0) })
		labels.forEach({
			let i = labels.indexOf($0)!
			$0.text = titles[i]
			$0.textAlignment = .Center
			$0.textColor = UIColor.whiteColor()
			$0.adjustsFontSizeToFitWidth = true
			$0.alpha = 0.0
			$0.tag = 123456789 + i
			addSubview($0)
		})
	}

	func addScoreLabel(frame: CGRect) {
		scoreLabel = UILabel(frame: frame)
		scoreLabel.textColor = UIColor.whiteColor()
		scoreLabel.textAlignment = .Right
		scoreLabel.font = UIFont.scoreFont(18)
		scoreLabel.adjustsFontSizeToFitWidth = true
		scoreLabel.text = "\(totalScore)"
		addSubview(scoreLabel)
	}

	func addcenterLabel(number: Int, frame: CGRect) {
		let label = UILabel(frame: frame)
		label.backgroundColor = UIColor.clearColor()
		label.textColor = UIColor.colorWithValues(MyColors.P_gold)
		label.textAlignment = .Center
		let size: CGFloat = ScreenHeight == 736 ? 21 : 20
		label.font = UIFont.systemFontOfSize(size)
		label.text = titles[number - 1]
		centerLabel = label
		centerLabel.adjustsFontSizeToFitWidth = true
		addSubview(centerLabel)
	}


	// MARK: - Functions

	func changeNumber(toNumber toNumber: Int) {
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			self.centerLabel.alpha = 0.0
			}) { (_) -> Void in
				self.centerLabel.text = self.titles[toNumber - 1]

				UIView.animateWithDuration(0.3, animations: { () -> Void in
					self.centerLabel.alpha = 1.0
				})
		}
	}

	func changeCenterLabelTitle(toTitle: String, backToNil: Bool) {
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			self.centerLabel.alpha = 0.0
		}) { (_) -> Void in
			self.centerLabel.text = toTitle

			UIView.animateWithDuration(0.3, animations: { 
				self.centerLabel.alpha = 1.0
				}, completion: { (_) in
					if backToNil {
						delay(seconds: 0.5, completion: { 
							UIView.animateWithDuration(0.3, animations: { () -> Void in
								self.centerLabel.alpha = 0.0
							}) { (_) -> Void in
								self.centerLabel.text = toTitle
							}
						})
					}
			})


		}
	}

	func showAllNumbers() {
		UIView.animateWithDuration(0.15) { () -> Void in
			self.centerLabel.alpha = 0.0
		}

		delay(seconds: 0.15) { () -> () in
			for i in 0..<10 {
				delay(seconds: 0.05 * Double(i), completion: {
					self.showNumberLabel(i + 1, textColor: self.numberColors[i])
				})
			}
		}

	}

	func showAndAddScore(number: Int) {
		currentScore += number
		totalScore += number
		scoreLabel.text = ""
		let numberForShow = number > 0 ? "+" + "\(number)" : "\(number)"
		let textColor = number > 0 ? UIColor.greenColor() : UIColor.redColor()
		numberColors.append(textColor)

		delay(seconds: 0.2) {
			self.scoreLabel.textColor = textColor
			self.scoreLabel.text = numberForShow
		}

		delay(seconds: 1.0) {
			self.scoreLabel.text = ""
			self.scoreLabel.textColor = UIColor.whiteColor()
			self.scoreLabel.text = "\(self.totalScore)"

		}
	}

	func startAllOver() {
		currentScore = 0
		numberColors.removeAll()

		for i in 0..<10 {
			delay(seconds: 0.05 * Double(i), completion: { () -> () in
				self.hideNumberLabel(i + 1, textColor: UIColor.whiteColor())
			})
		}

		delay(seconds: 0.5, completion: { self.changeNumber(toNumber: 1) })
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


	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}