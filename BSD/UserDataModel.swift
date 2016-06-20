//
//  RiskSurveyModel.swift
//  BSD
//
//  Created by Victor Yurkin on 6/20/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import Foundation
import CoreData

class UserDataModel {
    
    var context:NSManagedObjectContext
    
    init(contextLoc: NSManagedObjectContext) {
        self.context = contextLoc
    }
    
    func setUserData() {
        var entities = [UserData]()
        let request = NSFetchRequest(entityName: "UserData")
        request.returnsObjectsAsFaults = false
        do {
            let results = try self.context.executeFetchRequest(request)
            print(results)
            if(results.count > 0) {
                for item in results {
                    let entity = item as! UserData
                    entities.append(entity)
                }
                // Set Settings values
                let userDataEntity = entities[0] as UserData
                if userDataEntity.completedIntro == 1 {
                    Settings.sharedInstance.completedIntro = true
                }else {
                    Settings.sharedInstance.completedIntro = false
                }
                if userDataEntity.completedRisk == 1 {
                    Settings.sharedInstance.completedRisk = true
                }else {
                    Settings.sharedInstance.completedRisk = false
                }
                if userDataEntity.completedValues == 1 {
                    Settings.sharedInstance.completedValues = true
                }else {
                    Settings.sharedInstance.completedValues = false
                }
            }else {
                
                let entity = NSEntityDescription.insertNewObjectForEntityForName("UserData", inManagedObjectContext: self.context)
                entity.setValue(0, forKey: "completedIntro")
                entity.setValue(0, forKey: "completedRisk")
                entity.setValue(0, forKey: "completedValues")
                do {
                    try self.context.save()
                } catch {
                    print("Could not save")
                }

            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        
    }
    
    func setCompletedIntro() -> Bool {
        var entities = [UserData]()
        let request = NSFetchRequest(entityName: "UserData")
        request.returnsObjectsAsFaults = false
        do {
            let results = try self.context.executeFetchRequest(request)
            if(results.count > 0) {
                for item in results {
                    let entity = item as! UserData
                    entities.append(entity)
                }
                
                let entity = entities[0]
                entity.setValue(1, forKey: "completedIntro")
                do {
                    try self.context.save()
                } catch {
                    print("Could not save")
                }

            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return true
    }
    
    func setCompletedRisk() -> Bool {
        var entities = [UserData]()
        let request = NSFetchRequest(entityName: "UserData")
        request.returnsObjectsAsFaults = false
        do {
            let results = try self.context.executeFetchRequest(request)
            if(results.count > 0) {
                for item in results {
                    let entity = item as! UserData
                    entities.append(entity)
                }
                
                let entity = entities[0]
                entity.setValue(1, forKey: "completedRisk")
                do {
                    try self.context.save()
                } catch {
                    print("Could not save")
                }
                
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return true
    }
    
    func setCompletedValues() -> Bool {
        var entities = [UserData]()
        let request = NSFetchRequest(entityName: "UserData")
        request.returnsObjectsAsFaults = false
        do {
            let results = try self.context.executeFetchRequest(request)
            if(results.count > 0) {
                for item in results {
                    let entity = item as! UserData
                    entities.append(entity)
                }
                
                let entity = entities[0]
                entity.setValue(1, forKey: "completedValues")
                do {
                    try self.context.save()
                } catch {
                    print("Could not save")
                }
                
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return true
    }
    
}