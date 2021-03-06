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
    let answers = [
        "question2": ["[choice_1]": "WHITE", "[choice_2]": "AFRICAN AMERICAN", "[choice_3]": "HISPANIC", "[choice_4]": "ASIAN OR PACIFIC ISLANDER", "[choice_5]": "AMERICAN INDIAN OR ALASKAN NATIVE", "[choice_6]": "UNKNOWN"],
        "question3": ["[choice_1]": "7-11", "[choice_2]": "12-13", "[choice_3]": ">=14", "[choice_4]": "DoNotKnow"],
        "question4": ["[choice_1]": "YES", "[choice_2]": "NO"],
        "question5": ["[choice_1]": "YES", "[choice_2]": "NO", "[choice_3]": "UNKNOWN"],
        "question6": ["[choice_1]": "YES", "[choice_2]": "NO", "[choice_3]": "UNKNOWN"],
        "question7": ["[choice_1]": "0", "[choice_2]": "1", "[choice_3]": "MORE THAN 1", "[choice_4]": "DoNotKnow"],
        "question8": ["[choice_1]": "YES", "[choice_2]": "NO", "[choice_3]": "UNKNOWN"],
        "question9": ["[choice_1]": "YES", "[choice_2]": "NO", "[choice_3]": "UNKNOWN"],
        "question10": ["[choice_1]": "YES", "[choice_2]": "NO", "[choice_3]": "UNKNOWN"],
        "question11": ["[choice_1]": "YES", "[choice_2]": "NO", "[choice_3]": "UNKNOWN"],
        "question12": ["[choice_1]": "YES", "[choice_2]": "NO", "[choice_3]": "UNKNOWN"]
    ]
    
    func setRiskSurvey(riskSurveyEntity: RiskSurvey) {
        var ruskSurveyDict = [String: String]()
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
            ruskSurveyDict["started"] = "1"
        }else {
            ruskSurveyDict["started"] = "0"
        }
        if(riskSurveyEntity.completed == true) {
            ruskSurveyDict["completed"] = "1"
        }else {
            ruskSurveyDict["completed"] = "0"
        }
        self.defaults.setObject(ruskSurveyDict, forKey: "RiskSurvey")
    }
    
    func getRiskSurvey() -> RiskSurvey {
        let returnObject = RiskSurvey()
        if let anyObject = self.defaults.objectForKey("RiskSurvey") {
            let riskSurveyDict = anyObject as! [String:String]
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
            if(riskSurveyDict["started"] == "1") {
                returnObject.started = true
            }else {
                returnObject.started = false
            }
            if(riskSurveyDict["completed"] == "1") {
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
        let value = questionResult!["value"] as! String
        riskSurveyEntity.question1 = value

        questionResult = result["question2"]!
        var index = questionResult!["value"] as! String
        riskSurveyEntity.question2 = self.answers["question2"]![index]
        
        questionResult = result["question3"]!
        index = questionResult!["value"] as! String
        riskSurveyEntity.question3 = self.answers["question3"]![index]

        questionResult = result["question4"]!
        index = questionResult!["value"] as! String
        riskSurveyEntity.question4 = self.answers["question4"]![index]

        questionResult = result["question5"]!
        index = questionResult!["value"] as! String
        riskSurveyEntity.question5 = self.answers["question5"]![index]

        questionResult = result["question6"]!
        index = questionResult!["value"] as! String
        riskSurveyEntity.question6 = self.answers["question6"]![index]

        questionResult = result["question7"]!
        index = questionResult!["value"] as! String
        riskSurveyEntity.question7 = self.answers["question7"]![index]

        questionResult = result["question8"]!
        index = questionResult!["value"] as! String
        riskSurveyEntity.question8 = self.answers["question8"]![index]

        questionResult = result["question9"]!
        index = questionResult!["value"] as! String
        riskSurveyEntity.question9 = self.answers["question9"]![index]

        questionResult = result["question10"]!
        index = questionResult!["value"] as! String
        riskSurveyEntity.question10 = self.answers["question10"]![index]

        questionResult = result["question11"]!
        index = questionResult!["value"] as! String
        riskSurveyEntity.question11 = self.answers["question11"]![index]

        questionResult = result["question12"]!
        index = questionResult!["value"] as! String
        riskSurveyEntity.question12 = self.answers["question12"]![index]
        
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