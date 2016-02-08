//
//  ViewController.swift
//  P3
//
//  Created by Bobo on 1/22/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var term = [Term]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

		let chinese = Chinese()
		var words = [String]()

		for _ in 0..<100 {
			let pinyin = chinese.randomPinyinOfWord()
			print(pinyin)
			let results = chinese.wordsFromPinyin(pinyin)
			words += results
		}

		print(words)


    }
    
    func saveTerm(index: Double, word: String, pinyin: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Term", inManagedObjectContext: managedContext)
        let single = Term(entity: entity!, insertIntoManagedObjectContext: managedContext)
        single.word = word
        single.pinyin = pinyin
        single.index = index
        
        print(single.pinyin)
        
        do {
            try managedContext.save()
            print("success!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    func saveToEntity() {
        let terms = getTerms()
        
        var word = ""
        
        
        var words = [String]()
        var pinyins = [String]()
        
        for term in terms {
            word = term[0]
            words.append(word)
            
            var pinyin = ""
            for i in 1..<term.count {
                
                pinyin += (term[i] + " ")
                
            }
            
            pinyins.append(pinyin)
        }
        
        for i in 0..<words.count {
            saveTerm(Double(i), word: words[i], pinyin: pinyins[i])
        }
    }
    
    func getTerms() -> [[String]] {
        var terms = [[String]]()
        let path = NSBundle.mainBundle().pathForResource("terms", ofType: "plist")
        
        if NSFileManager.defaultManager().fileExistsAtPath(path!) {
            
            if let data = NSData(contentsOfFile: path!) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                terms = unarchiver.decodeObjectForKey("terms") as! [[String]]
                unarchiver.finishDecoding()
            }
            
        }
        
        return terms
        
    }
}

