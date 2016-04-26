//
//  UIView+.swift
//  P3
//
//  Created by 文川术 on 2/17/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

	func viewAddAnimation(animationType: AnimationType, delay: Double, distance: CGFloat) {

		switch animationType {
		case .BecomeVisble:
			self.alpha = 0.0

			UIView.animateWithDuration(0.5, delay: delay, options: [], animations: { () -> Void in
				self.alpha = 1.0
				}, completion: nil)

		case .Appear:
			alpha = 0.0
			frame.origin.y += distance
//			transform = CGAffineTransformMakeScale(1.2, 1.2)

			let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * delay ))
			dispatch_after(popTime, dispatch_get_main_queue()) {
				UIView.performSystemAnimation(.Delete, onViews: [], options: [], animations: {
					self.alpha = 1.0
					self.frame.origin.y -= distance
					}, completion: nil)
			}

//			UIView.animateWithDuration(0.5, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
//				self.alpha = 1.0
//				self.frame.origin.y -= distance
////				self.transform = CGAffineTransformIdentity
//				}, completion: nil)

		case .Disappear:
			UIView.animateWithDuration(0.5, delay: delay, options: [], animations: { () -> Void in
				self.alpha = 0.0
				}, completion: nil)

			
		default:
			break
		}
	}

	func addBorder(borderColor borderColor: UIColor, width: CGFloat) {
		self.layer.borderColor = borderColor.CGColor
		self.layer.borderWidth = width
	}

}