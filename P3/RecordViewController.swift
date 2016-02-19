//
//  RecordViewController.swift
//  P3
//
//  Created by 文川术 on 2/15/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit

class RecordViewController: UIViewController {

	var totalScore: Int!
	var dailyScores: [DailyScore]!
	var maxDailyNumber: UInt!
	var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.deepGray()
		navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.themeGold()]
		title = "Total Score: \(totalScore)"

		let quitButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "dismiss")
		navigationItem.rightBarButtonItem = quitButton

		tableView = UITableView(frame: view.bounds, style: .Plain)
		tableView.backgroundColor = UIColor.lightGray()
		tableView.separatorStyle = .None
		tableView.allowsSelection = false
		tableView.dataSource = self
		tableView.delegate = self
		view.addSubview(tableView)

	}

	func dismiss() {
		dismissViewControllerAnimated(true, completion: nil)
	}
}

extension RecordViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dailyScores.count
	}

	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 60
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = DailyScoreCell(style: .Default, reuseIdentifier: "DailyScoreCell")
		cell.configureForCell(dailyScores[indexPath.row], max: maxDailyNumber)
		return cell
	}
}