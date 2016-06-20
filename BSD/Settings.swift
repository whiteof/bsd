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
    
    var completedIntro: Bool = false
    var completedRisk: Bool = false
    var completedValues: Bool = false
}
