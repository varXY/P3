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

	func viewAddAnimation(_ animationType: AnimationType, delay: Double, distance: CGFloat) {

		switch animationType {
		case .becomeVisble:
			self.alpha = 0.0

			UIView.animate(withDuration: 0.5, delay: delay, options: [], animations: { () -> Void in
				self.alpha = 1.0
				}, completion: nil)

		case .appear:
			alpha = 0.0
			frame.origin.y += distance
//			transform = CGAffineTransformMakeScale(1.2, 1.2)

			let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * delay )) / Double(NSEC_PER_SEC)
			DispatchQueue.main.asyncAfter(deadline: popTime) {
				UIView.perform(.delete, on: [], options: [], animations: {
					self.alpha = 1.0
					self.frame.origin.y -= distance
					}, completion: nil)
			}

//			UIView.animateWithDuration(0.5, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
//				self.alpha = 1.0
//				self.frame.origin.y -= distance
////				self.transform = CGAffineTransformIdentity
//				}, completion: nil)

		case .disappear:
			UIView.animate(withDuration: 0.5, delay: delay, options: [], animations: { () -> Void in
				self.alpha = 0.0
				}, completion: nil)

			
		default:
			break
		}
	}

	func addBorder(borderColor: UIColor, width: CGFloat) {
		self.layer.borderColor = borderColor.cgColor
		self.layer.borderWidth = width
	}

}
