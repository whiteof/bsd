//
//  ValuesSurveyModel.swift
//  BSD
//
//  Created by Victor Yurkin on 6/24/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import Foundation

class ValuesSurveyModel {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func setValuesSurvey(valuesSurveyEntity: ValuesSurvey) {
        var valuesSurveyDict = [String: Int]()
        valuesSurveyDict["question1"] = valuesSurveyEntity.question1
        valuesSurveyDict["question2"] = valuesSurveyEntity.question2
        valuesSurveyDict["question3"] = valuesSurveyEntity.question3
        valuesSurveyDict["question4"] = valuesSurveyEntity.question4
        valuesSurveyDict["question5"] = valuesSurveyEntity.question5
        valuesSurveyDict["question6"] = valuesSurveyEntity.question6
        valuesSurveyDict["question7"] = valuesSurveyEntity.question7
        valuesSurveyDict["question8"] = valuesSurveyEntity.question8
        if(valuesSurveyEntity.started == true) {
            valuesSurveyDict["started"] = 1
        }else {
            valuesSurveyDict["started"] = 0
        }
        if(valuesSurveyEntity.completed == true) {
            valuesSurveyDict["completed"] = 1
        }else {
            valuesSurveyDict["completed"] = 0
        }
        self.defaults.setObject(valuesSurveyDict, forKey: "ValuesSurvey")
    }
    
    func getValuesSurvey() -> ValuesSurvey {
        let returnObject = ValuesSurvey()
        if let anyObject = self.defaults.objectForKey("ValuesSurvey") {
            let valuesSurveyDict = anyObject as! [String:Int]
            returnObject.question1 = valuesSurveyDict["question1"]
            returnObject.question2 = valuesSurveyDict["question2"]
            returnObject.question3 = valuesSurveyDict["question3"]
            returnObject.question4 = valuesSurveyDict["question4"]
            returnObject.question5 = valuesSurveyDict["question5"]
            returnObject.question6 = valuesSurveyDict["question6"]
            returnObject.question7 = valuesSurveyDict["question7"]
            returnObject.question8 = valuesSurveyDict["question8"]
            if(valuesSurveyDict["started"] == 1) {
                returnObject.started = true
            }else {
                returnObject.started = false
            }
            if(valuesSurveyDict["completed"] == 1) {
                returnObject.completed = true
            }else {
                returnObject.completed = false
            }
        }
        return returnObject
    }
    
    func saveTaskResult(dict: [String: AnyObject]) {
        
        let valuesSurveyEntity = self.getValuesSurvey()
        let result = dict["task"]!
        
        var questionResult = result["question1"]!
        var value = Int(questionResult!["value"] as! String)
        valuesSurveyEntity.question1 = value
        
        questionResult = result["question2"]!
        value = Int(questionResult!["value"] as! String)
        valuesSurveyEntity.question2 = value
        
        questionResult = result["question3"]!
        value = Int(questionResult!["value"] as! String)
        valuesSurveyEntity.question3 = value
        
        questionResult = result["question4"]!
        value = Int(questionResult!["value"] as! String)
        valuesSurveyEntity.question4 = value
        
        questionResult = result["question5"]!
        value = Int(questionResult!["value"] as! String)
        valuesSurveyEntity.question5 = value
        
        questionResult = result["question6"]!
        value = Int(questionResult!["value"] as! String)
        valuesSurveyEntity.question6 = value
        
        questionResult = result["question7"]!
        value = Int(questionResult!["value"] as! String)
        valuesSurveyEntity.question7 = value
        
        questionResult = result["question8"]!
        value = Int(questionResult!["value"] as! String)
        valuesSurveyEntity.question8 = value
        
        valuesSurveyEntity.completed = true
        
        self.setValuesSurvey(valuesSurveyEntity)
        
    }

}
