//
//  ValuesPageViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 6/24/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class ValuesPageViewController: UIPageViewController {
    
    let pageViewControllers: [UIViewController] = {
        let pageOne = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("valuesCompletedViewController")
        let pageTwo = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("valuesStartedViewController")
        return [pageOne, pageTwo]
    }()
    
    let valuesSurveyModel = ServiceManager.get("ValuesSurveyModel") as! ValuesSurveyModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let valuesSurveyEntity = self.valuesSurveyModel.getValuesSurvey()
        
        if (valuesSurveyEntity.completed == true) {
            setViewControllers([pageViewControllers[0]], direction: .Forward, animated: false, completion: nil)
        }else {
            setViewControllers([pageViewControllers[1]], direction: .Forward, animated: false, completion: nil)
        }

    }
    
}
