//
//  UIButton+genAnimation.swift
//  Q2
//
//  Created by 文川术 on 15/9/19.
//  Copyright © 2015年 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

	func addTextLabel(text: String, textColor: UIColor, font: UIFont, animated: Bool) {
		let label = UILabel(frame: self.bounds)
		label.text = text
		label.textColor = textColor
		label.font = font
		label.textAlignment = .Center
		addSubview(label)

		if animated { label.viewAddAnimation(.BecomeVisble, delay: 0.0, distance: 0.0) }
	}

	func addImageView(imageName: String, tintColor: UIColor?, animated: Bool) {
		let imageView = UIImageView()
		imageView.frame.size = CGSize(width: 22, height: 22)
		imageView.image = UIImage(named: imageName)
		if tintColor != nil { imageView.tintColor = tintColor }

		let center = CGPoint(x: CGRectGetMidX(bounds), y: CGRectGetMidY(bounds))
		imageView.center = center
		addSubview(imageView)

		if animated { imageView.viewAddAnimation(.BecomeVisble, delay: 0.0, distance: 0.0) }
	}

	func removeSubview(animated animated: Bool) {
		for view in self.subviews {
			if animated {
				UIView.animateWithDuration(0.5, animations: { () -> Void in
					view.alpha = 0.0
					}, completion: { (_) -> Void in
						view.removeFromSuperview()
				})
			} else {
				view.removeFromSuperview()
			}

		}
	}

	func changeColorWhenTouchDown(borderColor: UIColor) {
		let selector = borderColor == UIColor.whiteColor() ? "changeColorBack" : "changeColorBack_D"

		self.addTarget(self, action: "changeColor", forControlEvents: .TouchDown)
		self.addTarget(self, action: Selector(selector), forControlEvents: .TouchUpOutside)
		self.addTarget(self, action: Selector(selector), forControlEvents: .TouchUpInside)
	}

	func addAnimation(animationType: AnimationType, delay: Double, distance: CGFloat) {

		switch animationType {
		case .BecomeVisble:
			self.alpha = 0.0

			UIView.animateWithDuration(0.5, animations: { () -> Void in
				self.alpha = 1.0
			})

		case .Appear:
			self.alpha = 0.0
			self.frame.origin.y += distance

			UIView.animateWithDuration(0.5, delay: delay, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
				self.alpha = 1.0
				self.frame.origin.y -= distance
				}, completion: nil)

		case .Disappear:
			UIView.animateWithDuration(0.4, animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(0.5, 0.5)
				self.alpha = 0.0
				}, completion: { (_) -> Void in
					self.hidden = true
					self.transform = CGAffineTransformMakeScale(1.0, 1.0)
					self.alpha = 1.0
			})

		case .Touched:
			UIView.animateWithDuration(0.4, animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(1.5, 1.5)
				self.alpha = 0.0
				}, completion: { (what) -> Void in
					self.hidden = true
					self.transform = CGAffineTransformMakeScale(1.0, 1.0)
					self.alpha = 1.0
			})

		case .IsRightAnswer:
			UIView.animateWithDuration(0.4, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
				self.transform = CGAffineTransformMakeScale(1.06, 1.06)
				}, completion: nil)

		case .Bigger:
			self.alpha = 0.0
			self.transform = CGAffineTransformMakeScale(0.0, 0.0)

			UIView.animateWithDuration(0.5, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
				self.alpha = 1.0
				self.transform = CGAffineTransformMakeScale(1.0, 1.0)
				}, completion: nil)

		default:
			break
		}

	}

	func changeToColor(color: UIColor) {
		self.backgroundColor = color
		self.layer.borderColor = UIColor.whiteColor().CGColor
	}

	func changeColor() {
		self.backgroundColor = UIColor.themeGold()
		self.layer.borderColor = UIColor.themeGold().CGColor
	}

	func changeColorBack() {
		self.backgroundColor = UIColor.clearColor()
		self.layer.borderColor = UIColor.whiteColor().CGColor
	}

	func changeColorBack_D() {
		self.backgroundColor = UIColor.clearColor()
		self.layer.borderColor = UIColor.deepGray().CGColor
	}

	
}