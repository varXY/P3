//
//  SettingVC_1.swift
//  P3
//
//  Created by 文川术 on 2/15/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit


class SettingVC_1: UITableViewController {

	var type: Int!
	var titles = ["3", "4"]
	var selectedOne = String()
	var sendBack: ((Int) -> Void)?

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView = UITableView(frame: view.bounds, style: .Grouped)
		tableView.backgroundColor = UIColor.colorWithValues(MyColors.P_lightGray)
		titles = type == 0 ? [NSLocalizedString("Q&A", comment: "SettingVC"), NSLocalizedString("Free", comment: "SettingVC")] : ["3", "4"]
	}

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
		cell.textLabel?.text = titles[indexPath.row]
		if cell.textLabel?.text == selectedOne { cell.accessoryType = .Checkmark }
		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let cell = tableView.cellForRowAtIndexPath(indexPath)
		cell?.accessoryType = .Checkmark
		sendBack!(indexPath.row + 3)

		let row = indexPath.row == 0 ? 1 : 0
		let otherIndexPath = NSIndexPath(forRow: row, inSection: 0)
		let otherCell = tableView.cellForRowAtIndexPath(otherIndexPath)
		otherCell?.accessoryType = .None

		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		navigationController?.popToRootViewControllerAnimated(true)
	}
}