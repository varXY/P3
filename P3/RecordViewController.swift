//
//  RecordViewController.swift
//  P3
//
//  Created by 文川术 on 2/15/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

	var totalScore: Int!
	var dailyScores = [DailyScore]()
	var maxDailyNumber: UInt!
	var tableView: UITableView!

//	let fakeData = [
//		[109, "02/25/16"],
//		[96, "02/24/16"],
//		[-47, "02/23/16"],
//		[52, "02/22/16"],
//		[-30, "02/21/16"],
//		[36, "02/20/16"],
//		[60, "02/19/16"],
//		[55, "02/18/16"],
//		[-40, "02/17/16"],
//		[-52, "02/16/16"],
//		[20, "02/15/16"],
//		[34, "02/14/16"],
//		[42, "02/13/16"],
//		[66, "02/12/16"],
//
//	]

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.colorWithValues(MyColors.P_darkBlue)
//		title = NSLocalizedString("Total score:", comment: "RecordVC") + " 82"
        title = NSLocalizedString("Total score:", comment: "RecordVC") + " \(totalScore!)"
        
		let quitButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
		navigationItem.rightBarButtonItem = quitButton

		tableView = UITableView(frame: view.bounds, style: .plain)
		tableView.frame.size.height -= 64
		tableView.backgroundColor = UIColor.colorWithValues(MyColors.P_lightGray)
		tableView.separatorStyle = .none
		tableView.allowsSelection = false
		tableView.dataSource = self
		tableView.delegate = self
		view.addSubview(tableView)

		let footer = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 5))
		footer.backgroundColor = UIColor.clear
		tableView.tableFooterView = footer

	}

	@objc func dismissVC() {
		self.dismiss(animated: true, completion: nil)
	}
}

extension RecordViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return fakeData.count
		return dailyScores.count == 0 ? 1 : dailyScores.count
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = DailyScoreCell(style: .default, reuseIdentifier: "DailyScoreCell")
//		cell.showFakeData(fakeData[indexPath.row])

		if dailyScores.count == 0 {
			cell.showNoData()
		} else {
			cell.configureForCell(dailyScores[(indexPath as NSIndexPath).row], max: maxDailyNumber)
		}

		return cell

	}
}
