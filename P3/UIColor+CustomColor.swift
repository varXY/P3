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
    
    class func backgroundColor() -> UIColor {
        return UIColor(red: 236/255, green: 235/255, blue: 243/255, alpha: 1.0)
    }

	class func deepGreen() -> UIColor {
		return UIColor(red: 0/255, green: 153/255, blue: 153/255, alpha: 1.0)
	}

	class func lightGreen() -> UIColor {
		return UIColor(red: 0/255, green: 204/255, blue: 204/255, alpha: 1.0)
	}

	class func brightGreen() -> UIColor {
		return UIColor(red: 30/255, green: 240/255, blue: 30/255, alpha: 1.0)
	}

	class func electricRed() -> UIColor {
		return UIColor(red: 250/255, green: 30/255, blue: 30/255, alpha: 1.0)
	}

	class func lightElectricRed() -> UIColor {
		return UIColor(red: 250/255, green: 30/255, blue: 30/255, alpha: 0.7)
	}

	class func deepGray() -> UIColor {
		return UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
	}

	class func themeBlue() -> UIColor {
		return UIColor(red: 21/255, green: 108/255, blue: 195/255, alpha: 1.0)
	}

}