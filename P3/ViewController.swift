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
    
    var term = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Term")
        
        do {
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest)
            
            if let results = fetchedResults as? [NSManagedObject] {
                term = results
            }
            
        } catch let error as NSError {
            print("Counld not fetch \(error), \(error.userInfo)")
        }
    }
    
    func saveTerm(word: String, pinyin: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Term", inManagedObjectContext: managedContext)
        let single = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        single.setValue(word, forKey: "word")
        single.setValue(pinyin, forKey: "pinyin")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        term.append(single)
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

