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
		super.init(frame: CGRect(x: 0, y: 60, width: ScreenWidth, height: ScreenHeight / 2 - 80))
		backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
		textColor = UIColor.white
		textAlignment = .center
		numberOfLines = 0
		font = UIFont.systemFont(ofSize: ScreenHeight == 736 ? 22 : 21)
	}

    
	override func drawText(in rect: CGRect) {
		let insets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
		super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
	}

    
	func showCharacters(_ characters: [String]) {
		text = characters.reduce("", { $0! + $1 + " " })
	}

    
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    
}
