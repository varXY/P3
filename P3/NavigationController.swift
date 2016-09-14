//
//  NavigationViewController.swift
//  电工助手
//
//  Created by 文川术 on 12/20/15.
//  Copyright © 2015 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {


	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationBar.barTintColor = UIColor.clear
		self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
		self.navigationBar.tintColor = UIColor.white
		self.navigationBar.isTranslucent = false

		let rect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 64)
		self.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.clear, rect: rect), for: UIBarMetrics.default)
		self.navigationBar.shadowImage = UIImage.imageWithColor(UIColor.clear, rect: CGRect(x: 0, y: 0, width: 10, height: 10))

        self.delegate = self
        
	}

	override var preferredStatusBarStyle : UIStatusBarStyle {
		return .lightContent
	}
	
	func captureScreen() -> UIImage {

		let screen = UIApplication.shared.windows[0]

		UIGraphicsBeginImageContextWithOptions(screen.frame.size, false, 0)
		self.view.drawHierarchy(in: screen.bounds, afterScreenUpdates: true)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		var rect = CGRect()

		if ScreenHeight == 736 {
			rect = CGRect(x: 0, y: 20, width: ScreenWidth * 3, height: ScreenHeight * 3 - 20)
		} else {
			rect = CGRect(x: 0, y: 20, width: ScreenWidth * 2, height: ScreenHeight * 2 - 20)
		}

		let cuttedmage = image!.cgImage!.cropping(to: rect)
		let resultImage = UIImage(cgImage: cuttedmage!)

		return resultImage
	}
}

extension NavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {

		self.navigationBar.barTintColor = UIColor.colorWithValues(MyColors.P_darkBlue)
        
//        if viewController.isKindOfClass(InfoViewController) {
//            self.setNavigationBarHidden(true, animated: true)
//            let rect = CGRectMake(0, 0, self.view.frame.width, 64)
//            self.navigationBar.setBackgroundImage(UIImage.imageWithColor(Global.redColor(), rect: rect), forBarMetrics: UIBarMetrics.Default)
//            self.navigationBar.shadowImage = UIImage.imageWithColor(UIColor.clearColor(), rect: CGRectMake(0, 0, 10, 10))
//		} else {
//			self.navigationBar.barTintColor = UIColor(red: 60/255, green: 65/255, blue: 80/255, alpha: 1.0)
//		}


    }
}

