//
//  CoreDataHelper.swift
//  BSD
//
//  Created by Victor Yurkin on 6/20/16.
//  Copyright © 2016 WCM. All rights reserved.
//


import Foundation
import UIKit
import CoreData

class CoreDataHelper: NSObject, NSXMLParserDelegate {
    
    var context:NSManagedObjectContext?
    
    override init() {
        let appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let contextLoc:NSManagedObjectContext = appDel.managedObjectContext
        self.context = contextLoc
    }
    
    func getContextManager() -> NSManagedObjectContext {
        return self.context!
    }
    
}