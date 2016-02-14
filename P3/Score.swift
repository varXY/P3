//
//  Score.swift
//  P3
//
//  Created by 文川术 on 2/14/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit


class Score: NSObject, NSCoding {

	var score: Int!
	var time: NSDate!

	override init() {
		self.score = 0
		self.time = NSDate()
	}

	init(score: Int, time: NSDate) {
		self.score = score
		self.time = time
	}

	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(score, forKey: "Score")
		aCoder.encodeObject(time, forKey: "Time")
	}

	required init?(coder aDecoder: NSCoder) {
		score = aDecoder.decodeObjectForKey("Score") as! Int
		time = aDecoder.decodeObjectForKey("Time") as! NSDate
		super.init()
	}
}