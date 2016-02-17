//
//  FinalView.swift
//  P3
//
//  Created by 文川术 on 2/14/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit


protocol FinalViewDelegate: class {
	func finalViewButtonTapped(buttonType: FinalViewButtonType)
}

enum FinalViewButtonType {
	case Again, Quit
}

class FinalView: UIView {

	weak var delegate: FinalViewDelegate?

	init(title: String) {
		super.init(frame: CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: ScreenHeight - 100))
		self.backgroundColor = UIColor.whiteColor()

		let infoLabel = UILabel(frame: CGRect(x: 10, y: 10, width: self.frame.width - 20, height: 120))
		infoLabel.textColor = UIColor.blackColor()
		infoLabel.font = UIFont.boldSystemFontOfSize(20)
		infoLabel.textAlignment = .Center
		infoLabel.numberOfLines = 0
		infoLabel.text = title
		self.addSubview(infoLabel)

		for i in 0..<2 {
			let button = UIButton(type: .System)
			button.frame = CGRect(x: 20, y: (self.frame.height - 160) + 80 * CGFloat(i), width: self.frame.width - 40, height: 60)
			button.backgroundColor = UIColor.clearColor()
			button.addTextLabel(Titles.finalChoices[i], textColor: UIColor.deepGray(), font: UIFont.buttonTitleFont(22), animated: false)
			button.changeColorWhenTouchDown()
			button.addBorder(borderColor: UIColor.deepGray())
			button.addTarget(self, action: "finalChoice:", forControlEvents: .TouchUpInside)
			button.exclusiveTouch = true
			self.addSubview(button)
		}
	}

	func show() {

		UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.frame.origin.y -= self.frame.height
			}, completion: nil)

	}

	func finalChoice(sender: UIButton) {

		UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.frame.origin.y += self.frame.height
			}) { (_) -> Void in
				let buttonType = sender.titleLabel!.text == Titles.finalChoices[0] ? FinalViewButtonType.Again : FinalViewButtonType.Quit
				self.delegate?.finalViewButtonTapped(buttonType)
				self.removeFromSuperview()
		}

	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}