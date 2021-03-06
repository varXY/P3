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
		backgroundColor = UIColor.clear
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
			centerLabel.textAlignment = .right
			centerLabel.text = "pin"
		}

		if index == 11 {
			centerLabel.text = ""
		}
	}


	// MARK: - Add Contents

	func addBackButton(_ frame: CGRect) {
		let backButton = UIButton(type: .system)
		backButton.tintColor = UIColor.white
		backButton.frame = frame
		backButton.setImage(#imageLiteral(resourceName: "Back"), for: UIControlState())
		backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
		backButton.isExclusiveTouch = true
		addSubview(backButton)
	}


	func addOneToTenLabels() {
		let littleLabelWidth = (frame.width - 120) / 10
		let indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
		let frames = indexes.map({ CGRect(x: 60 + littleLabelWidth * CGFloat($0), y: 0, width: littleLabelWidth, height: frame.height) })
		let labels = frames.map({ UILabel(frame: $0) })
		labels.forEach({
			let i = labels.index(of: $0)!
			$0.text = titles[i]
			$0.textAlignment = .center
			$0.textColor = UIColor.white
			$0.adjustsFontSizeToFitWidth = true
			$0.alpha = 0.0
			$0.tag = 123456789 + i
			addSubview($0)
		})
	}

	func addScoreLabel(_ frame: CGRect) {
		scoreLabel = UILabel(frame: frame)
		scoreLabel.textColor = UIColor.white
		scoreLabel.textAlignment = .right
		scoreLabel.font = UIFont.scoreFont(18)
		scoreLabel.adjustsFontSizeToFitWidth = true
		scoreLabel.text = "\(totalScore)"
		addSubview(scoreLabel)
	}

	func addcenterLabel(_ number: Int, frame: CGRect) {
		let label = UILabel(frame: frame)
		label.backgroundColor = UIColor.clear
		label.textColor = UIColor.colorWithValues(MyColors.P_gold)
		label.textAlignment = .center
		let size: CGFloat = ScreenHeight == 736 ? 21 : 20
		label.font = UIFont.systemFont(ofSize: size)
		label.text = titles[number - 1]
		centerLabel = label
		centerLabel.adjustsFontSizeToFitWidth = true
		addSubview(centerLabel)
	}


	// MARK: - Functions

	func changeNumber(toNumber: Int) {
		UIView.animate(withDuration: 0.3, animations: { () -> Void in
			self.centerLabel.alpha = 0.0
			}, completion: { (_) -> Void in
				self.centerLabel.text = self.titles[toNumber - 1]

				UIView.animate(withDuration: 0.3, animations: { () -> Void in
					self.centerLabel.alpha = 1.0
				})
		}) 
	}

	func changeCenterLabelTitle(_ toTitle: String, backToNil: Bool) {
		UIView.animate(withDuration: 0.3, animations: { () -> Void in
			self.centerLabel.alpha = 0.0
		}, completion: { (_) -> Void in
			self.centerLabel.text = toTitle

			UIView.animate(withDuration: 0.3, animations: { 
				self.centerLabel.alpha = 1.0
				}, completion: { (_) in
					if backToNil {
						delay(seconds: 0.5, completion: { 
							UIView.animate(withDuration: 0.3, animations: { () -> Void in
								self.centerLabel.alpha = 0.0
							}, completion: { (_) -> Void in
								self.centerLabel.text = toTitle
							}) 
						})
					}
			})


		}) 
	}

	func showAllNumbers() {
		UIView.animate(withDuration: 0.15, animations: { () -> Void in
			self.centerLabel.alpha = 0.0
		}) 

		delay(seconds: 0.15) { () -> () in
			for i in 0..<10 {
				delay(seconds: 0.05 * Double(i), completion: {
					self.showNumberLabel(i + 1, textColor: self.numberColors[i])
				})
			}
		}

	}

	func showAndAddScore(_ number: Int) {
		currentScore += number
		totalScore += number
		scoreLabel.text = ""
		let numberForShow = number > 0 ? "+" + "\(number)" : "\(number)"
		let textColor = number > 0 ? UIColor.green : UIColor.red
		numberColors.append(textColor)

		delay(seconds: 0.2) {
			self.scoreLabel.textColor = textColor
			self.scoreLabel.text = numberForShow
		}

		delay(seconds: 1.0) {
			self.scoreLabel.text = ""
			self.scoreLabel.textColor = UIColor.white
			self.scoreLabel.text = "\(self.totalScore)"

		}
	}

	func startAllOver() {
		currentScore = 0
		numberColors.removeAll()

		for i in 0..<10 {
			delay(seconds: 0.05 * Double(i), completion: { () -> () in
				self.hideNumberLabel(i + 1, textColor: UIColor.white)
			})
		}

		delay(seconds: 0.5, completion: { self.changeNumber(toNumber: 1) })
	}


	// MARK: Local Functions

	func showNumberLabel(_ number: Int, textColor: UIColor) {
		if let label = self.viewWithTag(123456789 + number - 1) as? UILabel {
			showedNumberLabel = label
			showedNumber = number
			UIView.animate(withDuration: 0.3, animations: { () -> Void in
				label.textColor = textColor
				label.alpha = 1.0
			})
		}
	}

	func hideNumberLabel(_ number: Int, textColor: UIColor) {
		if let label = self.viewWithTag(123456789 + number - 1) as? UILabel {
			UIView.animate(withDuration: 0.3, animations: { () -> Void in
				label.alpha = 0.0
				label.textColor = textColor
			})
		}
	}

	@objc func backButtonTapped() {
		delegate?.backButtonTapped()
	}


	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}
