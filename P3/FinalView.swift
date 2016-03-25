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

	var titleLabel: UILabel!
	var numberLabel: UILabel!
	var bottomLabel: UILabel!

	weak var delegate: FinalViewDelegate?

	init() {
		super.init(frame: CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: ScreenHeight - 60))
		self.backgroundColor = UIColor.whiteColor()

		titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
		titleLabel.textAlignment = .Center
		titleLabel.font = UIFont.systemFontOfSize(20)
		addSubview(titleLabel)

		numberLabel = UILabel(frame: CGRect(x: 0, y: titleLabel.frame.height - 20, width: frame.width, height: frame.height - 160 - 60 - 50))
		numberLabel.textColor = UIColor.themeGold()
		numberLabel.textAlignment = .Center
		numberLabel.font = UIFont.scoreFont(90)
		addSubview(numberLabel)

		for i in 0..<2 {
			let button = UIButton(type: .System)
			button.frame = CGRect(x: 20, y: (self.frame.height - 160 - 60) + 80 * CGFloat(i), width: self.frame.width - 40, height: 60)
			button.backgroundColor = UIColor.clearColor()
			button.addTextLabel(Titles.finalChoices[i], textColor: UIColor.deepGray(), font: UIFont.systemFontOfSize(22), animated: false)
			button.changeColorWhenTouchDown(UIColor.deepGray())
			button.addBorder(borderColor: UIColor.deepGray(), width: 2.0)
			button.tag = 9999 + i
			button.addTarget(self, action: #selector(finalChoice(_:)), forControlEvents: .TouchUpInside)
			button.exclusiveTouch = true
			addSubview(button)
		}

		bottomLabel = UILabel(frame: CGRect(x: 0, y: frame.height - 60, width: frame.width, height: 60))
		bottomLabel.textColor =  UIColor.whiteColor()
		bottomLabel.font = UIFont.systemFontOfSize(22)
		bottomLabel.textAlignment = .Center
		bottomLabel.backgroundColor = UIColor.themeGold()
		addSubview(bottomLabel)
	}

	func show(currentScore: Int, delay: Double) {
		let win = currentScore >= 0
		let numberToShow = win ? currentScore : -currentScore
		titleLabel.textColor = win ? UIColor.rightGreen() : UIColor.wrongRed()
		titleLabel.text = win ? NSLocalizedString("You win:", comment: "FinalView") : NSLocalizedString("You lose:", comment: "FinalView")
		numberLabel.text = "\(numberToShow)"

		let formatter = NSDateFormatter()
		formatter.dateFormat = "HH:mm, MM-dd-yyyy"
		bottomLabel.text = formatter.stringFromDate(NSDate())
		
		UIView.animateWithDuration(0.5, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.frame.origin.y -= self.frame.height
			}, completion: nil)

	}

	func finalChoice(sender: UIButton) {

		UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.frame.origin.y += self.frame.height
			}) { (_) -> Void in
				let buttonType = sender.tag == 9999 ? FinalViewButtonType.Again : FinalViewButtonType.Quit
				self.delegate?.finalViewButtonTapped(buttonType)
		}

	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}