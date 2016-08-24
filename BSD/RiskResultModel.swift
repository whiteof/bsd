//
//  RiskResultModel.swift
//  BSD
//
//  Created by Victor Yurkin on 6/20/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import Foundation
import CoreData

class RiskResultModel {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func setRiskResult(riskResultEntity: RiskResult) {
        var ruskResultDict = [String: Float]()
        ruskResultDict["absrisk5yearperc"] = riskResultEntity.absrisk5yearperc
        ruskResultDict["avgrisk5yearperc"] = riskResultEntity.avgrisk5yearperc
        ruskResultDict["absrisklifeperc"] = riskResultEntity.absrisklifeperc
        ruskResultDict["avgrisklifeperc"] = riskResultEntity.avgrisklifeperc
        self.defaults.setObject(ruskResultDict, forKey: "RiskResult")
    }
    
    func getRiskResult() -> RiskResult {
        let returnObject = RiskResult()
        if let anyObject = self.defaults.objectForKey("RiskResult") {
            let riskResultDict = anyObject as! [String:Float]
            returnObject.absrisk5yearperc = riskResultDict["absrisk5yearperc"]
            returnObject.avgrisk5yearperc = riskResultDict["avgrisk5yearperc"]
            returnObject.absrisklifeperc = riskResultDict["absrisklifeperc"]
            returnObject.avgrisklifeperc = riskResultDict["avgrisklifeperc"]
        }
        return returnObject
    }
    
    func saveTaskResult(dict: [String: AnyObject]) {
        
        let riskResultEntity = self.getRiskResult()
        let result = dict["task"]!
        
        var questionResult = result["absrisk5yearperc"]!
        var value = Float(questionResult!["value"] as! Float)
        riskResultEntity.absrisk5yearperc = value
        
        questionResult = result["avgrisk5yearperc"]!
        value = Float(questionResult!["value"] as! Float)
        riskResultEntity.avgrisk5yearperc = value
        
        questionResult = result["absrisklifeperc"]!
        value = Float(questionResult!["value"] as! Float)
        riskResultEntity.absrisklifeperc = value
        
        questionResult = result["avgrisklifeperc"]!
        value = Float(questionResult!["value"] as! Float)
        riskResultEntity.avgrisklifeperc = value
        
        self.setRiskResult(riskResultEntity)
        
    }
    
}