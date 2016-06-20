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
            let coreDataHelper = self.get("CoreDataHelper") as! CoreDataHelper
            let contextLoc = coreDataHelper.getContextManager()
            return RiskSurveyModel(contextLoc: contextLoc)
        case "UserDataModel":
            let coreDataHelper = self.get("CoreDataHelper") as! CoreDataHelper
            let contextLoc = coreDataHelper.getContextManager()            
            return UserDataModel(contextLoc: contextLoc)

        //Helpers
        case "CoreDataHelper":
            return CoreDataHelper()
        case "ResearchKitHelper":
            return ResearchKitHelper()
            
        default:
            return nil
        }
    }
    
}