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
	func nextButtonTapped(title: NextButtonTitle)
}

enum NextButtonTitle {
	case Next, Confirm, Done

	var title: String? {
		switch self {
		case .Next: return nil
		case .Confirm: return Titles.confirm
		case .Done: return Titles.done
		}
	}
}

class NextButton: UIButton {

	var customTitleLabel = UILabel()
	var dismissAfterTapped = true
	var showed = false

	var titleType: NextButtonTitle = .Next

	weak var delegate: NextButtonDelegate?

	init() {
		super.init(frame: CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: 60))
		backgroundColor = UIColor.whiteColor()
		tintColor = UIColor.deepGray()
		addTarget(self, action: "nextButtonTapped", forControlEvents: .TouchUpInside)
		exclusiveTouch = true
		userInteractionEnabled = false
	}

	func nextButtonTapped() {
		if dismissAfterTapped { hide() }
		delegate?.nextButtonTapped(titleType)
	}

	func show(title: NextButtonTitle, dismissAfterTapped: Bool) {
		titleType = title
		self.dismissAfterTapped = dismissAfterTapped
		
		removeSubview(animated: false)

		switch title {
		case .Next:
			self.addImageView(ImageName.Next, tintColor: tintColor, animated: false)
		case .Confirm, .Done:
			self.addTextLabel(title.title!, textColor: tintColor, font: UIFont.buttonTitleFont(22), animated: false)
		}

		dispatch_async(dispatch_get_main_queue()) {
			UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
				self.frame.origin.y -= 60
				}, completion: {(success) -> Void in
					self.showed = true
					self.userInteractionEnabled = true
			})
		}

	}

	func changeTitle(toTitle: NextButtonTitle, dismissAfterTapped: Bool) {
		self.dismissAfterTapped = dismissAfterTapped
		titleType = toTitle
		self.removeSubview(animated: true)

		switch toTitle {
		case .Next:
			self.addImageView(ImageName.Next, tintColor: tintColor, animated: true)
		case .Confirm, .Done:
			self.addTextLabel(toTitle.title!, textColor: tintColor, font: UIFont.buttonTitleFont(22), animated: true)
		}
	}

	func hide() {
		titleType = .Next

		UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
			self.frame.origin.y += 60
			}, completion: {(_) -> Void in
				self.showed = false
				self.userInteractionEnabled = false
		})
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}