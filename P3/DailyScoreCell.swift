//
//  DailyScoreCell.swift
//  P3
//
//  Created by 文川术 on 2/15/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit


class DailyScoreCell: UITableViewCell {

	var scoreLabel: UILabel!
	var dateLabel: UILabel!

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		contentView.frame.size = CGSize(width: ScreenWidth, height: 60)
		contentView.backgroundColor = UIColor.deepGray()

		scoreLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: contentView.frame.height - 20))
		contentView.addSubview(scoreLabel)

		dateLabel = UILabel(frame: CGRect(x: contentView.frame.width / 2 - 50, y: 10, width: 100, height: contentView.frame.height - 20))
		dateLabel.textColor = UIColor.whiteColor()
		dateLabel.textAlignment = .Center
		contentView.addSubview(dateLabel)
	}

	func configureForCell(dailyScore: DailyScore, max: UInt) {
		let number = CGFloat(dailyScore.score)
		let positive = number >= 0

		let maxWidth = contentView.frame.width * 0.9
		let factor = maxWidth / CGFloat(max)
		let width = positive ? number * factor : -number * factor
		print(width)
		let x = positive ? 0 : ScreenWidth - width
		let color = positive ? UIColor.greenColor() : UIColor.redColor()

		let colorView = UIView(frame: CGRect(x: x, y: 5, width: width, height: contentView.frame.height - 5))
		colorView.backgroundColor = color
		contentView.addSubview(colorView)

		scoreLabel.frame.origin.x = positive ? 10 : contentView.frame.width - 90
		scoreLabel.textAlignment = positive ? .Left : .Right
		scoreLabel.text = positive ? "+" + String(dailyScore.score) : String(dailyScore.score)
		contentView.bringSubviewToFront(scoreLabel)

		dateLabel.text = dailyScore.date
		contentView.bringSubviewToFront(dateLabel)

	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}