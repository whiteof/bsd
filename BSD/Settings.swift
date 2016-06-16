//
//  Settings.swift
//  BSD
//
//  Created by Victor Yurkin on 6/8/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import Foundation

class Settings {
    static let sharedInstance = Settings()
    
    var completedIntro: Bool = true
    var completedSurvey: Bool = true
    var completedValues: Bool = true
}
