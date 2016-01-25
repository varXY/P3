//
//  Term+CoreDataProperties.swift
//  P3
//
//  Created by Bobo on 1/25/16.
//  Copyright © 2016 myname. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Term {

    @NSManaged var pinyin: String?
    @NSManaged var word: String?
    @NSManaged var index: Double

}
