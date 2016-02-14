//
//  NextButton.swift
//  P3
//
//  Created by 文川术 on 2/14/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit

protocol NextButtonDelegate: class {
	func nextButtonTapped(title: String)
}

class NextButton: UIButton {

	var customTitleLabel = UILabel()
	var showed = false

	weak var delegate: NextButtonDelegate?

	init(title: String) {
		super.init(frame: CGRect(x: 20, y: ScreenHeight, width: ScreenWidth - 40, height: 60))

		customTitleLabel = UILabel(frame: self.bounds)
		customTitleLabel.backgroundColor = UIColor.whiteColor()
		customTitleLabel.textAlignment = .Center
		customTitleLabel.font = UIFont.systemFontOfSize(18)
		customTitleLabel.textColor = UIColor.themeBlue()
		customTitleLabel.text = title
		self.addSubview(customTitleLabel)

		self.addTarget(self, action: "nextButtonTapped", forControlEvents: .TouchUpInside)
		self.exclusiveTouch = true
	}

	func nextButtonTapped() {
		self.showed = false
		self.delegate?.nextButtonTapped(self.customTitleLabel.text!)

		UIView.animateWithDuration(0.5) { () -> Void in
			self.frame.origin.y += 60
		}

	}

	func show(title: String) {
		self.customTitleLabel.text = title
		self.showed = true

		UIView.animateWithDuration(0.5) { () -> Void in
			self.frame.origin.y -= 60
		}
	}

	func hide() {
		self.showed = false

		UIView.animateWithDuration(0.5) { () -> Void in
			self.frame.origin.y += 60
		}
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}