//
//  NSString+resourceName.swift
//  P3
//
//  Created by 文川术 on 2/21/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


extension NSString {

	func resourceName() -> NSString {
		print(__FUNCTION__)
		let defaults = NSUserDefaults.standardUserDefaults()
		if let pinyin = defaults.valueForKey(Defaults.pronunciations) as? Bool {
			return pinyin ? "hanzi2pinyin_v2" : "hanzi2pinyin_v1"
		} else {
			return "hanzi2pinyin_v1"
		}
	}
}