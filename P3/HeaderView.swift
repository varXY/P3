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

	var totalScore = 0
	var currentScore = 0
	var scoreLabel = UILabel()

	weak var delegate: HeaderViewDelegate?

	init(page: Int, score: Int) {
		super.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 60))
		self.page = page
		self.totalScore = score

		let backButton = UIButton(type: .System)
		backButton.frame = CGRect(x: 10, y: 10, width: 40, height: 40)
		backButton.backgroundColor = UIColor.clearColor()
		backButton.tintColor = UIColor.whiteColor()
		backButton.setTitle("<", forState: .Normal)
		backButton.addTarget(self, action: "backButtonTapped", forControlEvents: .TouchUpInside)
		backButton.exclusiveTouch = true
		self.addSubview(backButton)

		pageLabel = UILabel(frame: CGRect(x: (self.frame.width - 100) / 2, y: 10, width: 100, height: 40))
		pageLabel.textColor = UIColor.whiteColor()
		pageLabel.textAlignment = .Center
		pageLabel.font = UIFont.boldSystemFontOfSize(16)
		pageLabel.text = "\(page)/10"
		self.addSubview(pageLabel)

		scoreLabel = UILabel(frame: CGRect(x: self.frame.width - 120, y: 10, width: 100, height: 40))
		scoreLabel.textColor = UIColor.whiteColor()
		scoreLabel.textAlignment = .Right
		scoreLabel.font = UIFont.systemFontOfSize(15)
		scoreLabel.text = "\(score)"
		self.addSubview(scoreLabel)
	}

	func backButtonTapped() {
		self.delegate?.backButtonTapped()
	}

	func clearCurrentScore() {
		self.currentScore = 0
	}

	func changePage(toPage: Int) {
		self.pageLabel.text = "\(toPage)/10"
	}

	func pageToTitle(title: String) {
		self.pageLabel.text = title
	}

	func showAndAddScore(number: Int) {

		currentScore += number

		scoreLabel.text = ""

		let numberForShow = number > 0 ? "+" + "\(number)" : "\(number)"

		delay(seconds: 0.2) { () -> () in
			UIView.animateWithDuration(0.5, animations: { () -> Void in
				self.scoreLabel.textColor = number > 0 ? UIColor.greenColor() : UIColor.redColor()
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

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}