//
//  SettingViewController.swift
//  P3
//
//  Created by 文川术 on 2/15/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit
import MessageUI
import StoreKit

class SettingViewController: UIViewController {

	var tableView: UITableView!
	var switchControl_S: UISwitch!
	var switchControl_V: UISwitch!

	var C_amount = 3
	var spellStyle = "Q&A"

	let titles = [
		[
			NSLocalizedString("Sound", comment: "SettingVC"),
			NSLocalizedString("Vibration", comment: "SettingVC")
		],

		[
			NSLocalizedString("Spell style", comment: "SettingVC"),
			NSLocalizedString("Number of wheels to spell with", comment: "SettingVC")],

		[
			NSLocalizedString("Rate this app", comment: "SettingVC"),
			NSLocalizedString("Share", comment: "SettingVC")
		],

		[NSLocalizedString("Feedback", comment: "SettingVC")]
	]

	let userDefaults = NSUserDefaults.standardUserDefaults()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = NSLocalizedString("Settings", comment: "SettingVC")

		let quitButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(dismiss))
		navigationItem.rightBarButtonItem = quitButton

		tableView = UITableView(frame: view.bounds, style: .Grouped)
		tableView.backgroundColor = UIColor.colorWithValues(MyColors.P_lightGray)
		tableView.dataSource = self
		tableView.delegate = self
		view = tableView

		switchControl_S = initialSwitchControl()
		switchControl_V = initialSwitchControl()

		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(productPurchased(_:)), name: IAPHelperProductPurchasedNotification, object: nil)
		getSettings()

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		userDefaults.synchronize()
	}

	func initialSwitchControl() -> UISwitch {
		let switchControl = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))
		switchControl.onTintColor = UIColor.colorWithValues(MyColors.P_rightGreen)
		switchControl.addTarget(self, action: #selector(switched(_:)), forControlEvents: UIControlEvents.ValueChanged)
		return switchControl
	}

	func getSettings() {
		let sound = userDefaults.boolForKey(Defaults.sound)
		switchControl_S.setOn(sound, animated: false)

		let vibration = userDefaults.boolForKey(Defaults.vibration)
		switchControl_V.setOn(vibration, animated: false)

		if let amount = userDefaults.valueForKey(Defaults.C_amount) as? Int {
			C_amount = amount
		} else {
			userDefaults.setInteger(C_amount, forKey: Defaults.C_amount)
		}

		if let style = userDefaults.valueForKey(Defaults.SpellStyle) as? String {
			spellStyle = style
		} else {
			userDefaults.setObject(spellStyle, forKey: Defaults.SpellStyle)
		}
	}

	func switched(sender: UISwitch) {
		let key = sender == switchControl_S ? Defaults.sound : Defaults.vibration
		userDefaults.setBool(sender.on, forKey: key)
	}

	func shareContent() {
		let text: String = NSLocalizedString("App Store: Pinyin Comparison", comment: "SettingVC")
		let link = NSURL(string: AppStoreLink)!
		let arr: [AnyObject] = [text, link]
		presentViewController(UIActivityViewController(activityItems: arr, applicationActivities: []), animated: true, completion: nil)
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
			controller.navigationBar.tintColor = UIColor.colorWithValues(MyColors.P_blue)
			controller.mailComposeDelegate = self
			controller.setSubject(NSLocalizedString("Feedback", comment: "SettingVC"))
			controller.setToRecipients(["pmlcfwcs@foxmail.com"])
			controller.setMessageBody(messageBody, isHTML: false)
			presentViewController(controller, animated: true, completion: nil)
		}

	}

	func dismiss() {
		dismissViewControllerAnimated(true, completion: nil)
	}

	// MARK: - Purchase

	func connectToStore() {
		let indicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
		indicator.frame = CGRectMake(0, -128, ScreenWidth, ScreenHeight + 128)
		indicator.startAnimating()
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
				let action_cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: "SettingVC"), style: .Cancel, handler: nil)

				alertSheet.addAction(action_0)
				alertSheet.addAction(action_2)
				alertSheet.addAction(action_1)
				alertSheet.addAction(action_cancel)
				self.presentViewController(alertSheet, animated: true, completion: nil)

			} else {
				let title = NSLocalizedString("Failed To Connect", comment: "SettingVC")
				let message = NSLocalizedString("Please check your settings and try again.", comment: "SettingVC")
				let ok = NSLocalizedString("OK", comment: "SettingVC")
				let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
				let action = UIAlertAction(title: ok, style: .Default, handler: nil)
				alertController.addAction(action)
				self.presentViewController(alertController, animated: true, completion: nil)
			}
		})
	}

	func purchaseProduct(product: SKProduct) {
		SupportProducts.store.purchaseProduct(product)
		let hudView = HudView.hudInView(self.view, animated: true)
		hudView.text = NSLocalizedString("Thank you!", comment: "SettingVC")
	}

	func productPurchased(notification: NSNotification) {
		_ = notification.object as! String
	}
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return IAPHelper.canMakePayments() ? 4 : 3
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return titles[section].count
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
		cell.textLabel?.text = titles[indexPath.section][indexPath.row]

		switch indexPath.section {
		case 0:
			let switchControl = indexPath.row == 0 ? switchControl_S : switchControl_V
			cell.addSubview(switchControl)

		case 1:
			cell = UITableViewCell(style: .Value1, reuseIdentifier: "Cell_1")
			cell.textLabel?.text = titles[indexPath.section][indexPath.row]
			cell.detailTextLabel?.text = indexPath.row == 0 ? NSLocalizedString(spellStyle, comment: "SettingVC") : String(C_amount)
			cell.accessoryType = .DisclosureIndicator

		case 2, 3:
			cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
			cell.textLabel?.textAlignment = .Center

		default:
			break
		}

		return cell
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

		switch indexPath.section {
		case 0:
			let switchControl = indexPath.row == 0 ? switchControl_S : switchControl_V
			let defaults = indexPath.row == 0 ? Defaults.sound : Defaults.vibration
			switchControl.on ? switchControl.setOn(false, animated: true) : switchControl.setOn(true, animated: true)
			userDefaults.setBool(switchControl.on, forKey: defaults)

		case 1:
			let settingVC_1 = SettingVC_1()
			settingVC_1.type = indexPath.row

			switch indexPath.row {
			case 0:
				settingVC_1.selectedOne = NSLocalizedString(spellStyle, comment: "SettingVC")
				settingVC_1.sendBack = { [weak self] selected -> Void in
					self!.spellStyle = selected == 3 ? "Q&A" : "Free"
					self!.userDefaults.setObject(self?.spellStyle, forKey: Defaults.SpellStyle)
				}
			case 1:
				settingVC_1.selectedOne = String(C_amount)
				settingVC_1.sendBack = { [weak self] selected -> Void in
					self!.C_amount = selected
					self!.userDefaults.setInteger(self!.C_amount, forKey: Defaults.C_amount)
				}
			default:
				break
			}

			navigationController?.pushViewController(settingVC_1, animated: true)

		case 2:
			switch indexPath.row {
			case 0: UIApplication.sharedApplication().openURL(NSURL(string: iTunesViewLink)!)
			case 1: shareContent()
			default: break
			}

		case 3:
			menuViewControllerSendSupportEmail()

		default:
			break
		}

		tableView.deselectRowAtIndexPath(indexPath, animated: true)

	}

}

extension SettingViewController: MFMailComposeViewControllerDelegate {

	func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
		controller.dismissViewControllerAnimated(true, completion: nil)
	}

}