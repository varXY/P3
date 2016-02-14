//
//  ScoreModel.swift
//  P3
//
//  Created by 文川术 on 2/14/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


class ScoreModel {

	var totalScore = Int()
	var scores = [Score]()

	init() {
		loadScores()
	}

	func documentDiretory() -> String {
		let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
		return paths[0]
	}

	func dataFilePath() -> String {
		return "\(documentDiretory())/ScoreModel.plist"
	}

	func saveScores() {
		let data = NSMutableData()
		let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
		archiver.encodeInteger(totalScore, forKey: "TotalScore")
		archiver.encodeObject(scores, forKey: "Scores")
		archiver.finishEncoding()
		data.writeToFile(dataFilePath(), atomically: true)
	}

	func loadScores() {
		let path = dataFilePath()

		if NSFileManager.defaultManager().fileExistsAtPath(path) {

			if let data = NSData(contentsOfFile: path) {
				let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
				totalScore = unarchiver.decodeIntegerForKey("TotalScore")
				scores = unarchiver.decodeObjectForKey("Scores") as! [Score]
				unarchiver.finishDecoding()
			}
			
		}
		
	}
}