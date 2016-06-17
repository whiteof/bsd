//
//  UserData+CoreDataProperties.swift
//  BSD
//
//  Created by Victor Yurkin on 6/17/16.
//  Copyright © 2016 WCM. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension UserData {

    @NSManaged var completedIntro: NSNumber?
    @NSManaged var completedRisk: NSNumber?
    @NSManaged var completedValues: NSNumber?

}
