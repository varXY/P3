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
	var switchControl: UISwitch!

	let titles = ["Sound", "Component Amount", "Feed Back"]
	var C_amount = Int()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Setting"

		let quitButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "dismiss")
		navigationItem.rightBarButtonItem = quitButton

		tableView = UITableView(frame: view.bounds, style: .Grouped)
		tableView.backgroundColor = UIColor.lightGray()
		tableView.dataSource = self
		tableView.delegate = self
		view = tableView

		switchControl = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))

		let userDefaults = NSUserDefaults.standardUserDefaults()
		if let soundOn = userDefaults.valueForKey(Defaults.sound) as? Bool {
			switchControl.setOn(soundOn, animated: true)
		} else {
			switchControl.setOn(true, animated: true)
		}

		C_amount = userDefaults.integerForKey(Defaults.C_amount)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}

	func menuViewControllerSendSupportEmail() {

		if MFMailComposeViewController.canSendMail() {
			let controller = MFMailComposeViewController()
			controller.navigationBar.tintColor = UIColor.themeBlue()
			controller.mailComposeDelegate = self
			controller.setSubject("反馈")
			controller.setToRecipients(["pmlcfwcs@foxmail.com"])
			presentViewController(controller, animated: true, completion: nil)
		}

	}

	func dismiss() {
		dismissViewControllerAnimated(true, completion: nil)
	}
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 2
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return section == 0 ? 2 : 1
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")

		if indexPath.section == 0 && indexPath.row == 0 {
			cell.textLabel?.text = titles[0]
			cell.addSubview(switchControl)
		}

		if indexPath.section == 0 && indexPath.row == 1 {
			cell = UITableViewCell(style: .Value1, reuseIdentifier: "Cell_1")
			cell.textLabel?.text = titles[1]
			cell.detailTextLabel?.text = String(C_amount)
			cell.accessoryType = .DisclosureIndicator
		}

		if indexPath.section == 1 {
			cell.textLabel?.text = titles[2]
			cell.textLabel?.textAlignment = .Center
		}

		return cell
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let userDefaults = NSUserDefaults.standardUserDefaults()

		if indexPath.section == 0 && indexPath.row == 0 {
			switchControl.on ? switchControl.setOn(false, animated: true) : switchControl.setOn(true, animated: true)
			userDefaults.setBool(switchControl.on, forKey: Defaults.sound)
		}

		if indexPath.section == 0 && indexPath.row == 1 {
			let settingVC_1 = SettingVC_1()
			settingVC_1.selectedOne = C_amount
			settingVC_1.sendBack = { (selected) -> Void in
				self.C_amount = selected
				userDefaults.setInteger(self.C_amount, forKey: Defaults.C_amount)
			}
			navigationController?.pushViewController(settingVC_1, animated: true)
		}

		if indexPath.section == 1 && indexPath.row == 0 {
			menuViewControllerSendSupportEmail()
		}

		tableView.deselectRowAtIndexPath(indexPath, animated: true)

	}
}

extension SettingViewController: MFMailComposeViewControllerDelegate {

	func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
//		self.doneWithMail!(controller)
		controller.dismissViewControllerAnimated(true, completion: nil)
	}

}