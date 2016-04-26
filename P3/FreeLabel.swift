//
//  File.swift
//  Pinyin Comparison
//
//  Created by 文川术 on 4/26/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit

class FreeLabel: UILabel, WordCharacterPinyin {


	init() {
		super.init(frame: CGRectMake(0, 60, ScreenWidth, ScreenHeight / 2 - 80))
		backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
		textColor = UIColor.whiteColor()
		textAlignment = .Center
		numberOfLines = 0
		font = UIFont.systemFontOfSize(ScreenHeight == 736 ? 22 : 21)
	}

	override func drawTextInRect(rect: CGRect) {
		let insets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
		super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
	}

	func showCharacters(characters: [String]) {
//		UIView.animateWithDuration(0.3, animations: { () -> Void in
//			self.alpha = 0.0
//		}) { (_) -> Void in
//			self.text = characters.reduce("", combine: { $0! + $1 + " " })
//
//			UIView.animateWithDuration(0.3, animations: { () -> Void in
//				self.alpha = 1.0
//			})
//		}
		text = characters.reduce("", combine: { $0! + $1 + " " })
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}