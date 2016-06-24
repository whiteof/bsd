//
//  RiskSurveyModel.swift
//  BSD
//
//  Created by Victor Yurkin on 6/20/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import Foundation

class UserDataModel {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func setUserData(userDataEntity: UserData) {
        self.defaults.setObject(userDataEntity, forKey: "UserData")
    }

    func getUserData() -> UserData {
        return self.defaults.objectForKey("UserData") as! UserData
    }

}