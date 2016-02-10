//
//  SelectTheSameViewController.swift
//  P3
//
//  Created by 文川术 on 2/10/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit

class SelectTheSameViewController: UIViewController {

	let chinese = Chinese()

	var quitButton = UIButton()

	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.deepGray()

		quitButton = UIButton(type: .InfoLight)
		quitButton.frame = CGRect(x: view.frame.width - 50, y: 20, width: 30, height: 30)
		quitButton.addTarget(self, action: "confirmToQuit", forControlEvents: .TouchUpInside)
		self.view.addSubview(quitButton)

		addSixBlocks()

		chinese.sixPinyinAndCharacters()
		print(chinese.forSelectTheSame)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)
	}

	func addSixBlocks() {

		for i in 0..<6 {
			let x = 30 + ((self.view.frame.width - 90) / 2 + 30) * CGFloat(i % 2)
			let y = blockY(i)

			let blockView = BlockView(type: .SelectTheSame, origin: CGPoint(x: x, y: y), text: ["chan", "馋"])
			self.view.addSubview(blockView)
		}
	}

	func blockY(number: Int) -> CGFloat {
		switch number {
		case 0, 1:
			return 60
		case 2, 3:
			return 60 + (self.view.frame.width - 90) / 2 + 30
		case 4, 5:
			return 60 + ((self.view.frame.width - 90) / 2 + 30) * 2
		default:
			return 60
		}
	}

	func confirmToQuit() {
		//		scrollView.removeFromSuperview()
		self.navigationController?.popViewControllerAnimated(true)
	}

}