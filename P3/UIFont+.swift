//
//  UIFont+CustomFont.swift
//  P3
//
//  Created by 文川术 on 2/16/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit

extension UIFont {

	class func homepageTitleFont(size: CGFloat) -> UIFont {
		return UIFont(name: "Geneva", size: size)!
		// SignPainter-HouseScript
	}

	class func buttonTitleFont(size: CGFloat) -> UIFont {
		return UIFont(name: "Tahoma", size: size)!
	}

	class func pickerFont(size: CGFloat) -> UIFont {
		return UIFont(name: "AmericanTypewriter", size: size)!
		// Arial Rounded MT Bold
		// Tahoma-Blod
	}

	class func scoreFont(size: CGFloat) -> UIFont {
		return UIFont(name: "GillSans", size: size)!
		// ArialNarrow
		// GillSans
		// ChalkboardSE-Regular
		// Georgia
	}
}