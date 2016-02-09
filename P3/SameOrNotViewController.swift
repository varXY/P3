//
//  SameOrNotViewController.swift
//  P3
//
//  Created by 文川术 on 2/9/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit

class SameOrNotViewController: UIViewController {

	var chinese = Chinese()
	var blockViews = [BlockView]()

	var pinyinVisble = false

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.deepGray()

		chinese.getOneForSameOrNot()

		for i in 0..<2 {
			let blockWidth = (ScreenWidth - 60) / 2
			let point = CGPoint(x: 20 + (blockWidth + 20) * CGFloat(i), y: 20)
			let blockView = BlockView(type: .SameOrNot, origin: point, text: chinese.forSameOrNot[i])
			blockViews.append(blockView)
			self.view.addSubview(blockView)
		}

		let tapGesture = UITapGestureRecognizer(target: self, action: "tapped")
		self.view.addGestureRecognizer(tapGesture)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(false, animated: true)
	}

	func tapped() {
		if !pinyinVisble {
			pinyinVisble = true

			for blockView in blockViews {
				blockView.showPinyin()
			}
		}

	}
}