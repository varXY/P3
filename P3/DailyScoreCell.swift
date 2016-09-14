//
//  DailyScoreCell.swift
//  P3
//
//  Created by 文川术 on 2/15/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit


class DailyScoreCell: UITableViewCell {

	var scoreLabel: UILabel!
	var dateLabel: UILabel!

    
    
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		contentView.frame.size = CGSize(width: ScreenWidth, height: 60)
		contentView.backgroundColor = UIColor.colorWithValues(MyColors.P_lightGray)

		scoreLabel = UILabel(frame: CGRect(x: 10, y: 5, width: 180, height: contentView.frame.height - 5))
		scoreLabel.textColor = UIColor.colorWithValues(MyColors.P_darkBlue)
		scoreLabel.font = UIFont.scoreFont(18)
		contentView.addSubview(scoreLabel)

		dateLabel = UILabel(frame: CGRect(x: contentView.frame.width - 110, y: 5, width: 100, height: contentView.frame.height - 5))
		dateLabel.textColor = UIColor.colorWithValues(MyColors.P_darkBlue)
		dateLabel.textAlignment = .right
		contentView.addSubview(dateLabel)
	}

    
	func showFakeData(_ data: [AnyObject]) {
		let max = 109
		let number = CGFloat(data[0] as! Int)
		let positive = number >= 0

		let maxWidth = contentView.frame.width * 0.9
		let factor = maxWidth / CGFloat(max)
		let width = positive ? number * factor : -number * factor
		let color = positive ? UIColor.colorWithValues(MyColors.P_rightGreen) : UIColor.colorWithValues(MyColors.P_wrongRed)

		let colorView = UIView(frame: CGRect(x: 0, y: 5, width: width, height: contentView.frame.height - 5))
		colorView.backgroundColor = color
		contentView.addSubview(colorView)

		scoreLabel.text = positive ? "+" + String(data[0] as! Int) : String(data[0] as! Int)
		contentView.bringSubview(toFront: scoreLabel)

		dateLabel.text = data[1] as? String
		contentView.bringSubview(toFront: dateLabel)
	}

    
	func showNoData() {
		scoreLabel.text = Titles.noRecords
	}

    
	func configureForCell(_ dailyScore: DailyScore, max: UInt) {
		let number = CGFloat(dailyScore.score)
		let positive = number >= 0

		let maxWidth = contentView.frame.width * 0.9
		let factor = max == 0 ? 0 : maxWidth / CGFloat(max)
		let width = positive ? number * factor : -number * factor
		let color = positive ? UIColor.colorWithValues(MyColors.P_rightGreen) : UIColor.colorWithValues(MyColors.P_wrongRed)

		let colorView = UIView(frame: CGRect(x: 0, y: 5, width: width, height: contentView.frame.height - 5))
		colorView.backgroundColor = color
		contentView.addSubview(colorView)

		scoreLabel.text = positive ? "+" + String(dailyScore.score) : String(dailyScore.score)
		contentView.bringSubview(toFront: scoreLabel)

		dateLabel.text = dailyScore.date
		contentView.bringSubview(toFront: dateLabel)

	}

    
	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
    
}
