//
//  LianLianKan.swift
//  Pinyin Comparison
//
//  Created by 文川术 on 4/26/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit

@objc protocol LittleTouchDownAndUp {
	func touchDown(sender: UIButton)
	func touchUpOutside(sender: UIButton)
	func touchUpInside(sender: UIButton)
}


struct LianLianKan {

	var buttons = [UIButton]()

	init(content: [String], VC: SelectTheSameViewController) {
		buttons = buttonFrames().map({
			let index = buttonFrames().indexOf($0)!
			let button = UIButton(type: .System)
			button.frame = $0
			button.backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
			button.tintColor = UIColor.whiteColor()
			button.setTitle(content[index], forState: .Normal)
			button.titleLabel?.font = UIFont.systemFontOfSize(20)
			button.addTarget(VC, action: #selector(LittleTouchDownAndUp.touchDown(_:)), forControlEvents: .TouchDown)
			button.addTarget(VC, action: #selector(LittleTouchDownAndUp.touchUpOutside(_:)), forControlEvents: .TouchUpOutside)
			button.addTarget(VC, action: #selector(LittleTouchDownAndUp.touchUpInside(_:)), forControlEvents: .TouchUpInside)
			button.tag = index + 200
			return button
		})
	}

	func buttonFrames() -> [CGRect] {
		var frames = [CGRect]()
		let gap: CGFloat = 1
		let length = (ScreenWidth - 40 - (gap * 5)) / 6
		var i: CGFloat = 0
		repeat {
			let x = 20 + (length + gap) * (i % 6)
			let y = 60 + (length + gap) * floor(i / 6)
			let frame = CGRect(x: x, y: y, width: length, height: length)
			frames.append(frame)
			i += 1
		} while i < 60

		return frames
	}
}