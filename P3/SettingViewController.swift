//
//  SettingViewController.swift
//  P3
//
//  Created by 文川术 on 2/15/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
import StoreKit

class SettingViewController: UIViewController {

	var tableView: UITableView!
	var switchControl_S: UISwitch!
	var switchControl_V: UISwitch!
	var switchControl_P: UISwitch!

	var C_amount = 3

	let titles = ["Sound", "Vibration", "Number of wheels to spell with", "Include uncommon pinyin", "Feedback", "Contribute"]

	let userDefaults = NSUserDefaults.standardUserDefaults()

	override func viewDidLoad() {
		super.viewDidLoad()
//		navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.themeGold()]
		self.title = "Settings"

		let quitButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "dismiss")
		navigationItem.rightBarButtonItem = quitButton

		tableView = UITableView(frame: view.bounds, style: .Grouped)
		tableView.backgroundColor = UIColor.lightGray()
		tableView.dataSource = self
		tableView.delegate = self
//		tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
		view = tableView

		switchControl_S = initialSwitchControl()
		switchControl_V = initialSwitchControl()
		switchControl_P = initialSwitchControl()

//		switchControl_S = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))
//		switchControl_S.onTintColor = UIColor.rightGreen()
//		switchControl_S.addTarget(self, action: "switched:", forControlEvents: UIControlEvents.ValueChanged)
//
//		switchControl_V = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))
//		switchControl_V.onTintColor = UIColor.rightGreen()
//		switchControl_V.addTarget(self, action: "switched:", forControlEvents: UIControlEvents.ValueChanged)
//
//		switchControl_P = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))
//		switchControl_P.onTintColor = UIColor.rightGreen()
//		switchControl_P.addTarget(self, action: "switched:", forControlEvents: UIControlEvents.ValueChanged)

		NSNotificationCenter.defaultCenter().addObserver(self, selector: "productPurchased:", name: IAPHelperProductPurchasedNotification, object: nil)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		getSettings()
		tableView.reloadData()
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		userDefaults.synchronize()
	}

	func initialSwitchControl() -> UISwitch {
		let switchControl = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))
		switchControl.onTintColor = UIColor.rightGreen()
		switchControl.addTarget(self, action: "switched:", forControlEvents: UIControlEvents.ValueChanged)
		return switchControl
	}

	func getSettings() {
		let sound = userDefaults.boolForKey(Defaults.sound)
		switchControl_S.setOn(sound, animated: false)

		let vibration = userDefaults.boolForKey(Defaults.vibration)
		switchControl_V.setOn(vibration, animated: false)

		if let pronunciations = userDefaults.valueForKey(Defaults.pronunciations) as? Bool {
			switchControl_P.setOn(pronunciations, animated: true)
		} else {
			switchControl_P.setOn(false, animated: true)
			userDefaults.setBool(false, forKey: Defaults.pronunciations)
		}

		if let amount = userDefaults.valueForKey(Defaults.C_amount) as? Int {
			C_amount = amount
		} else {
			C_amount = 3
			userDefaults.setInteger(C_amount, forKey: Defaults.C_amount)
		}
	}

	func switched(sender: UISwitch) {

		if sender == switchControl_S {
			userDefaults.setBool(sender.on, forKey: Defaults.sound)
		}

		if sender == switchControl_V {
			userDefaults.setBool(sender.on, forKey: Defaults.vibration)
		}

		if sender == switchControl_P {
			userDefaults.setBool(sender.on, forKey: Defaults.pronunciations)
		}
	}

	func menuViewControllerSendSupportEmail() {

		let appInfoDict = NSBundle.mainBundle().infoDictionary
		let appName = appInfoDict!["CFBundleName"] as! String
		let appVersion = appInfoDict!["CFBundleShortVersionString"] as! String

		let deviceName = UIDevice.currentDevice().model
		let iOSVersion = UIDevice.currentDevice().systemVersion

		let messageBody = "\n\n\n" + appName + "_" + appVersion + "\n" + deviceName + "_" + iOSVersion

		if MFMailComposeViewController.canSendMail() {
			let controller = MFMailComposeViewController()
			controller.navigationBar.tintColor = UIColor.themeBlue()
			controller.mailComposeDelegate = self
			controller.setSubject("反馈")
			controller.setToRecipients(["pmlcfwcs@foxmail.com"])
			controller.setMessageBody(messageBody, isHTML: false)
			presentViewController(controller, animated: true, completion: nil)
		}

	}

	func dismiss() {
		let userdefaults = NSUserDefaults.standardUserDefaults()
		userdefaults.synchronize()
		dismissViewControllerAnimated(true, completion: nil)
	}

	// MARK: - Purchase

	func connectToStore() {

		let indicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
		indicator.startAnimating()
		indicator.frame = self.view.bounds
		indicator.frame.size.height += 64
		indicator.frame.origin.y -= 64
		UIView.animateWithDuration(0.3, animations: { indicator.backgroundColor = UIColor(red: 45/255, green: 47/255, blue: 56/255, alpha: 0.45) })
		tableView.addSubview(indicator)
		tableView.userInteractionEnabled = false

		SupportProducts.store.requestProductsWithCompletionHandler({ (success, products) -> () in
			indicator.removeFromSuperview()
			self.tableView.userInteractionEnabled = true
			if success {
				priceFormatter.locale = products[0].priceLocale

				let alertSheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)

				let action_0 = UIAlertAction(title: priceFormatter.stringFromNumber(products[0].price), style: .Default, handler: { (_) -> () in self.purchaseProduct(products[0]) })
				let action_1 = UIAlertAction(title: priceFormatter.stringFromNumber(products[1].price), style: .Default, handler: { (_) -> () in self.purchaseProduct(products[1]) })
				let action_2 = UIAlertAction(title: priceFormatter.stringFromNumber(products[2].price), style: .Default, handler: { (_) -> () in self.purchaseProduct(products[2]) })

				let action_cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)

				alertSheet.addAction(action_0)
				alertSheet.addAction(action_2)
				alertSheet.addAction(action_1)
				alertSheet.addAction(action_cancel)
				self.presentViewController(alertSheet, animated: true, completion: nil)

			} else {
				let alertController = UIAlertController(title: "Failed To Connect", message: "Please check your settings and try again.", preferredStyle: .Alert)
				let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
				alertController.addAction(action)
				self.presentViewController(alertController, animated: true, completion: nil)
			}
		})
	}

	func purchaseProduct(product: SKProduct) {
		SupportProducts.store.purchaseProduct(product)
	}

	func productPurchased(notification: NSNotification) {
		let productIdentifier = notification.object as! String
		print(__FUNCTION__)
		print(productIdentifier)
	}
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 3
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let section_2_rows = IAPHelper.canMakePayments() ? 2 : 1
		switch section {
		case 0: return 2
		case 1: return 2
		case 2: return section_2_rows
		default: return 0
		}
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")

		if indexPath.section == 0 {
			cell.textLabel?.text = titles[indexPath.row]

			let switchControl = indexPath.row == 0 ? switchControl_S : switchControl_V
			cell.addSubview(switchControl)
		}

		if indexPath.section == 1 && indexPath.row == 0 {
			cell = UITableViewCell(style: .Value1, reuseIdentifier: "Cell_1")
			cell.textLabel?.text = titles[indexPath.row + 2]
			cell.detailTextLabel?.text = String(C_amount)
			cell.accessoryType = .DisclosureIndicator
		}

		if indexPath.section == 1 && indexPath.row == 1 {
			cell.textLabel?.text = titles[indexPath.row + 2]
			cell.addSubview(switchControl_P)
		}

		if indexPath.section == 2 {
			cell.textLabel?.text = titles[indexPath.row + 4]
			cell.textLabel?.textAlignment = .Center
		}

		return cell
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

		if indexPath.section == 0 && indexPath.row == 0 {
			switchControl_S.on ? switchControl_S.setOn(false, animated: true) : switchControl_S.setOn(true, animated: true)
			userDefaults.setBool(switchControl_S.on, forKey: Defaults.sound)
		}

		if indexPath.section == 0 && indexPath.row == 1 {
			switchControl_V.on ? switchControl_V.setOn(false, animated: true) : switchControl_V.setOn(true, animated: true)
			userDefaults.setBool(switchControl_V.on, forKey: Defaults.vibration)
		}

		if indexPath.section == 1 && indexPath.row == 0 {
			let settingVC_1 = SettingVC_1()
			settingVC_1.selectedOne = C_amount
			settingVC_1.sendBack = { (selected) -> Void in
				self.C_amount = selected
				self.userDefaults.setInteger(self.C_amount, forKey: Defaults.C_amount)
			}
			navigationController?.pushViewController(settingVC_1, animated: true)
		}

		if indexPath.section == 1 && indexPath.row == 1 {
			switchControl_P.on ? switchControl_P.setOn(false, animated: true) : switchControl_P.setOn(true, animated: true)
			userDefaults.setBool(switchControl_P.on, forKey: Defaults.pronunciations)
		}

		if indexPath.section == 2 && indexPath.row == 0 {
			menuViewControllerSendSupportEmail()
		}

		if indexPath.section == 2 && indexPath.row == 1 {
			connectToStore()
		}

		tableView.deselectRowAtIndexPath(indexPath, animated: true)

	}

}

extension SettingViewController: MFMailComposeViewControllerDelegate {

	func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
		controller.dismissViewControllerAnimated(true, completion: nil)
	}

}