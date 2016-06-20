//
//  RiskSurveyModel.swift
//  BSD
//
//  Created by Victor Yurkin on 6/20/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import Foundation
import CoreData

class RiskSurveyModel {

    var context:NSManagedObjectContext
    
    init(contextLoc: NSManagedObjectContext) {
        self.context = contextLoc
    }
    
    func getRiskSurvey() -> [RiskSurvey] {
        var entities = [RiskSurvey]()
        let request = NSFetchRequest(entityName: "RiskSurvey")
        request.returnsObjectsAsFaults = false
        do {
            let results = try self.context.executeFetchRequest(request)
            if(results.count > 0) {
                for item in results {
                    let entity = item as! RiskSurvey
                    entities.append(entity)
                }
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return entities
    }
    
    func save(dict: [String: AnyObject]) -> Bool {
        let result = dict["task"]!
        
        let request = NSFetchRequest(entityName: "RiskSurvey")
        request.returnsObjectsAsFaults = false
        let results = try! self.context.executeFetchRequest(request) as! [NSManagedObject]
        if(results.count > 0) {
            let entity = results[0]
            var questionResult = result["question1"]!
            var value = Int(questionResult!["value"] as! String)
            entity.setValue(value, forKey: "question1")
            
            questionResult = result["question2"]!
            var valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question2")
            
            questionResult = result["question3"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question3")
            
            questionResult = result["question4"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question4")
            
            questionResult = result["question5"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question5")
            
            questionResult = result["question6"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question6")
            
            questionResult = result["question7"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question7")
            
            questionResult = result["question8"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question8")
            
            questionResult = result["question9"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question9")
            
            questionResult = result["question10"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question10")
            
            questionResult = result["question11"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question11")
            
            questionResult = result["question12"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question12")
            
        }else {
            let entity = NSEntityDescription.insertNewObjectForEntityForName("RiskSurvey", inManagedObjectContext: self.context)
            var questionResult = result["question1"]!
            var value = Int(questionResult!["value"] as! String)
            entity.setValue(value, forKey: "question1")
            
            questionResult = result["question2"]!
            var valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question2")
            
            questionResult = result["question3"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question3")
            
            questionResult = result["question4"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question4")
            
            questionResult = result["question5"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question5")
            
            questionResult = result["question6"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question6")
            
            questionResult = result["question7"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question7")
            
            questionResult = result["question8"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question8")
            
            questionResult = result["question9"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question9")
            
            questionResult = result["question10"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question10")
            
            questionResult = result["question11"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question11")
            
            questionResult = result["question12"]!
            valueStr = questionResult!["value"] as! String
            valueStr = valueStr.stringByReplacingOccurrencesOfString("[choice_", withString: "")
            valueStr = valueStr.stringByReplacingOccurrencesOfString("]", withString: "")
            value = Int(valueStr)!
            entity.setValue(value, forKey: "question12")
        }

        
        do {
            try self.context.save()
        } catch {
            print("Could not save")
        }
        
        return true
    }
}