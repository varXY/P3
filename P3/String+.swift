//
//  String+.swift
//  P3
//
//  Created by 文川术 on 2/15/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


extension String {

	var localized: String! {
		let localizedString = NSLocalizedString(self, comment: "")
		return localizedString
	}

	mutating func addPositiveMark() {
		self = "+" + self
	}

}