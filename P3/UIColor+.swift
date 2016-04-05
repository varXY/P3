//
//  UIColor+CustomColor.swift
//  P2
//
//  Created by Bobo on 1/9/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

struct MyColors {

	static let P_blue: [CGFloat] = [25, 120, 203, 1.0]
	static let P_darkBlue: [CGFloat] = [61, 67, 82, 1.0]
	static let P_gold: [CGFloat] = [221, 183, 116, 1.0]
	static let P_lightGray: [CGFloat] = [240, 240, 240, 1.0]
	static let P_rightGreen: [CGFloat] = [40, 197, 101, 1.0]
	static let P_wrongRed: [CGFloat] = [226, 67, 54, 1.0]

// 1.1.1老颜色
//	static let P_blue: [CGFloat] = [21, 108, 196, 1.0]
//	static let P_darkBlue: [CGFloat] = [60, 65, 80, 1.0]
//	static let P_gold: [CGFloat] = [215, 177, 112, 1.0]
//	static let P_lightGray: [CGFloat] = [240, 240, 240, 1.0]
//	static let P_rightGreen: [CGFloat] = [40, 197, 101, 1.0]
//	static let P_wrongRed: [CGFloat] = [226, 67, 54, 1.0]

}

extension UIColor {

	// 简化RGB颜色生成
	class func colorWithValues(values: [CGFloat]) -> UIColor {
		return UIColor(red: values[0]/255, green: values[1]/255, blue: values[2]/255, alpha: values[3])
	}

}