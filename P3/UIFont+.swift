//
//  UIFont+CustomFont.swift
//  P3
//
//  Created by 文川术 on 2/16/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit

extension UIFont {

	class func homepageTitleFont(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Geneva", size: size)!
		// SignPainter-HouseScript
	}

	class func buttonTitleFont(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Tahoma", size: size)!
	}

	class func pickerFont(_ size: CGFloat) -> UIFont {
		return UIFont(name: "AmericanTypewriter", size: size)!
		// Arial Rounded MT Bold
		// Tahoma-Blod
	}

	class func scoreFont(_ size: CGFloat) -> UIFont {
		return UIFont(name: "GillSans", size: size)!
		// ArialNarrow
		// GillSans
		// ChalkboardSE-Regular
		// Georgia
	}
}
