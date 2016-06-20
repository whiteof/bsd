//
//  ResearchKitHelper.swift
//  BSD
//
//  Created by Victor Yurkin on 6/20/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import Foundation
import ResearchKit

class ResearchKitHelper {
    
    func dictFromTaskResult(taskResult: ORKTaskResult) -> [String: AnyObject]? {
        
        var retDict: [String:AnyObject] = [:]
        retDict["taskRunUUID"] = taskResult.taskRunUUID.UUIDString
        retDict["startDate"] = "\(taskResult.startDate)"
        retDict["endDate"] = "\(taskResult.endDate)"
        for result in taskResult.results! {
            if let stepResult = result as? ORKStepResult {
                retDict[stepResult.identifier] = dictFromStepResult(stepResult) ?? [:]
            }
        }
        return [taskResult.identifier : retDict]
        
    }
    func dictFromStepResult(stepResult: ORKStepResult) -> [String: AnyObject] {
        var retDict: [String:AnyObject] = [:]
        retDict["startDate"] = "\(stepResult.startDate)"
        retDict["endDate"] = "\(stepResult.endDate)"
        for result in stepResult.results! {
            if result is ORKQuestionResult {
                retDict["value"] = "\((result as! ORKQuestionResult).stringValue())"
            }
        }
        return retDict
    }
    
}