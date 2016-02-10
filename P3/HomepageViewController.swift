//
//  ViewController.swift
//  P3
//
//  Created by Bobo on 1/22/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit
import CoreData

class HomepageViewController: UIViewController {



	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.deepGray()

		addThreeMainButtons()
		
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)

    }

	func addThreeMainButtons() {

		let titles = ["SAME OR DIFFERENT", "SELECT THE SAME", "SPELL IT"]
		let buttonHeight: CGFloat = 60
		let center = CGPoint(x: ScreenWidth / 2, y: ScreenHeight / 2)

		for i in 0..<3 {
			let button = UIButton(type: .System)
			button.frame.size = CGSize(width: ScreenWidth - 40, height: buttonHeight)
			button.center = CGPoint(x: center.x, y: center.y + (buttonHeight + 20) * CGFloat(i))

			button.backgroundColor = UIColor.whiteColor()
			button.tintColor = UIColor.themeBlue()
			button.titleLabel?.font = UIFont.systemFontOfSize(19)
			button.setTitle(titles[i], forState: .Normal)
			button.exclusiveTouch = true

			button.tag = 10 + i
			button.addTarget(self, action: "bigButtonTapped:", forControlEvents: .TouchUpInside)

			self.view.addSubview(button)
		}
	}

	func bigButtonTapped(sender: UIButton) {

		switch sender.tag {
		case 10:
			let sameOrNotVC = SameOrNotViewController()
			self.navigationController?.pushViewController(sameOrNotVC, animated: true)

		case 11:
			let selectTheSameVC = SelectTheSameViewController()
			self.navigationController?.pushViewController(selectTheSameVC, animated: true)

		default:
			break
		}
	}
    

}

