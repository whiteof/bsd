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
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func setRiskSurvey(riskSurveyEntity: RiskSurvey) {
        var ruskSurveyDict = [String: Int]()
        ruskSurveyDict["question1"] = riskSurveyEntity.question1
        ruskSurveyDict["question2"] = riskSurveyEntity.question2
        ruskSurveyDict["question3"] = riskSurveyEntity.question3
        ruskSurveyDict["question4"] = riskSurveyEntity.question4
        ruskSurveyDict["question5"] = riskSurveyEntity.question5
        ruskSurveyDict["question6"] = riskSurveyEntity.question6
        ruskSurveyDict["question7"] = riskSurveyEntity.question7
        ruskSurveyDict["question8"] = riskSurveyEntity.question8
        ruskSurveyDict["question9"] = riskSurveyEntity.question9
        ruskSurveyDict["question10"] = riskSurveyEntity.question10
        ruskSurveyDict["question11"] = riskSurveyEntity.question11
        ruskSurveyDict["question12"] = riskSurveyEntity.question12
        if(riskSurveyEntity.started == true) {
            ruskSurveyDict["started"] = 1
        }else {
            ruskSurveyDict["started"] = 0
        }
        if(riskSurveyEntity.completed == true) {
            ruskSurveyDict["completed"] = 1
        }else {
            ruskSurveyDict["completed"] = 0
        }
        self.defaults.setObject(ruskSurveyDict, forKey: "RiskSurvey")
    }
    
    func getRiskSurvey() -> RiskSurvey {
        let returnObject = RiskSurvey()
        if let anyObject = self.defaults.objectForKey("RiskSurvey") {
            let riskSurveyDict = anyObject as! [String:Int]
            returnObject.question1 = riskSurveyDict["question1"]
            returnObject.question2 = riskSurveyDict["question2"]
            returnObject.question3 = riskSurveyDict["question3"]
            returnObject.question4 = riskSurveyDict["question4"]
            returnObject.question5 = riskSurveyDict["question5"]
            returnObject.question6 = riskSurveyDict["question6"]
            returnObject.question7 = riskSurveyDict["question7"]
            returnObject.question8 = riskSurveyDict["question8"]
            returnObject.question9 = riskSurveyDict["question9"]
            returnObject.question10 = riskSurveyDict["question10"]
            returnObject.question11 = riskSurveyDict["question11"]
            returnObject.question12 = riskSurveyDict["question12"]
            if(riskSurveyDict["started"] == 1) {
                returnObject.started = true
            }else {
                returnObject.started = false
            }
            if(riskSurveyDict["completed"] == 1) {
                returnObject.completed = true
            }else {
                returnObject.completed = false
            }
        }
        return returnObject
    }
    
    func saveTaskResult(dict: [String: AnyObject]) {
        
        let riskSurveyEntity = self.getRiskSurvey()
        let result = dict["task"]!
        
        var questionResult = result["question1"]!
        var value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question1 = value

        questionResult = result["question2"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question2 = value
        
        questionResult = result["question3"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question3 = value

        questionResult = result["question4"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question4 = value

        questionResult = result["question5"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question5 = value

        questionResult = result["question6"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question6 = value

        questionResult = result["question7"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question7 = value

        questionResult = result["question8"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question8 = value

        questionResult = result["question9"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question9 = value

        questionResult = result["question10"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question10 = value

        questionResult = result["question11"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question11 = value

        questionResult = result["question12"]!
        value = Int(questionResult!["value"] as! String)
        riskSurveyEntity.question12 = value
        
        riskSurveyEntity.completed = true
        
        self.setRiskSurvey(riskSurveyEntity)

    }
    
    /*
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
 */
}