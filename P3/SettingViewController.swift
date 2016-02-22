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

class SettingViewController: UIViewController {

	var tableView: UITableView!
	var switchControl_S: UISwitch!
	var switchControl_V: UISwitch!
	var switchControl_P: UISwitch!

	let defaults = [Defaults.sound, Defaults.vibration, Defaults.pronunciations]

	var C_amount = 3

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
		view = tableView

		switchControl_S = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))
		switchControl_S.onTintColor = UIColor.rightGreen()
		switchControl_S.addTarget(self, action: "switched:", forControlEvents: UIControlEvents.ValueChanged)

		switchControl_V = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))
		switchControl_V.onTintColor = UIColor.rightGreen()
		switchControl_V.addTarget(self, action: "switched:", forControlEvents: UIControlEvents.ValueChanged)

		switchControl_P = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))
		switchControl_P.onTintColor = UIColor.rightGreen()
		switchControl_P.addTarget(self, action: "switched:", forControlEvents: UIControlEvents.ValueChanged)

		let userDefaults = NSUserDefaults.standardUserDefaults()

		if let soundOn = userDefaults.valueForKey(Defaults.sound) as? Bool {
			switchControl_S.setOn(soundOn, animated: true)
		} else {
			switchControl_S.setOn(true, animated: true)
		}

		if let vibration = userDefaults.valueForKey(Defaults.vibration) as? Bool {
			switchControl_V.setOn(vibration, animated: true)
		} else {
			switchControl_V.setOn(true, animated: true)
		}

		if let pronunciations = userDefaults.valueForKey(Defaults.pronunciations) as? Bool {
			switchControl_P.setOn(pronunciations, animated: true)
		} else {
			switchControl_P.setOn(false, animated: true)
		}

		if let amount = userDefaults.valueForKey(Defaults.C_amount) as? Int {
			C_amount = amount
		} else {
			C_amount = 3
			userDefaults.setInteger(C_amount, forKey: Defaults.C_amount)
		}


	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}

	func switched(sender: UISwitch) {
		let userDefaults = NSUserDefaults.standardUserDefaults()

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

		let deviceName = UIDevice.currentDevice().localizedModel
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
		dismissViewControllerAnimated(true, completion: nil)
	}
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 3
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0: return 2
		case 1: return 2
		case 2: return 1
		default: return 0
		}
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")

		if indexPath.section == 0 {
			cell.textLabel?.text = Titles.settingTitles[indexPath.row]

			let switchControl = indexPath.row == 0 ? switchControl_S : switchControl_V
			cell.addSubview(switchControl)
		}

		if indexPath.section == 1 && indexPath.row == 0 {
			cell.textLabel?.text = Titles.settingTitles[indexPath.row + 2]
			cell.addSubview(switchControl_P)
		}

		if indexPath.section == 1 && indexPath.row == 1 {
			cell = UITableViewCell(style: .Value1, reuseIdentifier: "Cell_1")
			cell.textLabel?.text = Titles.settingTitles[indexPath.row + 2]
			cell.detailTextLabel?.text = String(C_amount)
			cell.accessoryType = .DisclosureIndicator
		}

		if indexPath.section == 2 {
			cell.textLabel?.text = Titles.settingTitles[indexPath.row + 4]
			cell.textLabel?.textAlignment = .Center
		}

		return cell
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let userDefaults = NSUserDefaults.standardUserDefaults()

		if indexPath.section == 0 && indexPath.row == 0 {
			switchControl_S.on ? switchControl_S.setOn(false, animated: true) : switchControl_S.setOn(true, animated: true)
			userDefaults.setBool(switchControl_S.on, forKey: Defaults.sound)
		}

		if indexPath.section == 0 && indexPath.row == 1 {
			switchControl_V.on ? switchControl_V.setOn(false, animated: true) : switchControl_V.setOn(true, animated: true)
			userDefaults.setBool(switchControl_V.on, forKey: Defaults.vibration)
		}

		if indexPath.section == 1 && indexPath.row == 0 {
			switchControl_P.on ? switchControl_P.setOn(false, animated: true) : switchControl_P.setOn(true, animated: true)
			userDefaults.setBool(switchControl_P.on, forKey: Defaults.pronunciations)
		}

		if indexPath.section == 1 && indexPath.row == 1 {
			let settingVC_1 = SettingVC_1()
			settingVC_1.selectedOne = C_amount
			settingVC_1.sendBack = { (selected) -> Void in
				self.C_amount = selected
				userDefaults.setInteger(self.C_amount, forKey: Defaults.C_amount)
			}
			navigationController?.pushViewController(settingVC_1, animated: true)
		}

		if indexPath.section == 2 && indexPath.row == 0 {
			menuViewControllerSendSupportEmail()
		}

		tableView.deselectRowAtIndexPath(indexPath, animated: true)

	}
}

extension SettingViewController: MFMailComposeViewControllerDelegate {

	func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
		controller.dismissViewControllerAnimated(true, completion: nil)
	}

}