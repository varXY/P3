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
		super.init(frame: CGRect(x: 10, y: ScreenHeight, width: ScreenWidth - 20, height: ScreenHeight - 100))
		self.backgroundColor = UIColor.whiteColor()

		let infoLabel = UILabel(frame: CGRect(x: 10, y: 10, width: self.frame.width - 20, height: 120))
		infoLabel.textColor = UIColor.blackColor()
		infoLabel.font = UIFont.boldSystemFontOfSize(20)
		infoLabel.textAlignment = .Center
		infoLabel.numberOfLines = 0
		infoLabel.text = title
		self.addSubview(infoLabel)

		let titles = ["Again", "Quit"]
		for i in 0..<2 {
			let button = UIButton(type: .System)
			button.frame = CGRect(x: 10, y: (self.frame.height - 120) + 60 * CGFloat(i), width: self.frame.width - 20, height: 50)
			button.backgroundColor = UIColor.themeBlue()
			button.tintColor = UIColor.whiteColor()
			button.setTitle(titles[i], forState: .Normal)
			button.addTarget(self, action: "finalChoice:", forControlEvents: .TouchUpInside)
			button.exclusiveTouch = true
			self.addSubview(button)
		}
	}

	func show() {
		UIView.animateWithDuration(0.5) { () -> Void in
			self.frame.origin.y -= self.frame.height
		}
	}

	func finalChoice(sender: UIButton) {
		UIView.animateWithDuration(0.5, animations: { () -> Void in
			self.frame.origin.y += self.frame.height
			}) { (_) -> Void in
				let buttonType = sender.titleLabel!.text == "Again" ? FinalViewButtonType.Again : FinalViewButtonType.Quit
				self.delegate?.finalViewButtonTapped(buttonType)
				self.removeFromSuperview()
		}

	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}