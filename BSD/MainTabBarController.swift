//
//  MainTabBarController.swift
//  BSD
//
//  Created by Victor Yurkin on 6/24/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let riskSurveyModel = ServiceManager.get("RiskSurveyModel") as! RiskSurveyModel
    let valuesSurveyModel = ServiceManager.get("ValuesSurveyModel") as! ValuesSurveyModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Disable all other tab bars
        let items = self.tabBar.items
        for item in items! {
            item.enabled = false
        }
        let firstItem = items![0]
        firstItem.enabled = true

        let riskSurveyEntity = self.riskSurveyModel.getRiskSurvey()
        if (riskSurveyEntity.completed == true) {
            let screeningItem = items![1]
            screeningItem.enabled = true
            
            let valuesItem = items![2]
            valuesItem.enabled = true
        }
        
        let valuesSurveyEntity = self.valuesSurveyModel.getValuesSurvey()
        if (valuesSurveyEntity.completed == true) {
            let summaryItem = items![3]
            summaryItem.enabled = true
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
