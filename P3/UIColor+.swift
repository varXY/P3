//
//  UIColor+CustomColor.swift
//  P2
//
//  Created by Bobo on 1/9/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    
    class func darkerWhite() -> UIColor {
        return UIColor(red: 236/255, green: 235/255, blue: 243/255, alpha: 1.0)
    }

	class func lightGray() -> UIColor {
		return UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
	}

	class func deepGray() -> UIColor {
		return UIColor(red: 60/255, green: 65/255, blue: 80/255, alpha: 1.0)
	}

	class func deepGrayLighter() -> UIColor {
		return UIColor(red: 67/255, green: 72/255, blue: 85/255, alpha: 1.0)
	}

	class func themeBlue() -> UIColor {
		return UIColor(red: 21/255, green: 108/255, blue: 196/255, alpha: 1.0)
	}

	class func themeGold() -> UIColor {
		return UIColor(red: 215/255, green: 177/255, blue: 112/255, alpha: 1.0)
	}

	class func rightGreen() -> UIColor {
		return UIColor(red: 40/255, green: 197/255, blue: 101/255, alpha: 1.0)
	}

	class func wrongRed() -> UIColor {
		return UIColor(red: 226/255, green: 67/255, blue: 54/255, alpha: 1.0)
	}

}