//
//  ServiceManager.swift
//  BSD
//
//  Created by Victor Yurkin on 6/20/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import Foundation

class ServiceManager {
    
    class func get(serviceName: String) -> AnyObject? {
        
        switch serviceName {
            
        // Models
        case "RiskSurveyModel":
            return RiskSurveyModel()
        case "UserDataModel":
            return UserDataModel()
        case "ValuesSurveyModel":
            return ValuesSurveyModel()

        //Helpers
        case "ResearchKitHelper":
            return ResearchKitHelper()
            
        default:
            return nil
        }
    }
    
}