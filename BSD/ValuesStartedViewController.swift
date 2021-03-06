//
//  ValuesCompletedViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 6/24/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit
import ResearchKit

class ValuesStartedViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    @IBOutlet weak var htmlContainer: UIWebView!
    
    let valuesSurveyModel = ServiceManager.get("ValuesSurveyModel") as! ValuesSurveyModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let valuesSurveyEntity = self.valuesSurveyModel.getValuesSurvey()
        if (valuesSurveyEntity.completed == false && valuesSurveyEntity.started == false) {
            self.startSurvey()
        }
        if (valuesSurveyEntity.completed == true) {
            self.parentViewController?.viewDidAppear(false)
        }
        
        // Get and load HTML
        let localfilePath = NSBundle.mainBundle().URLForResource("ValuesStarted", withExtension: "html")
        let htmlRequest = NSURLRequest(URL: localfilePath!)
        self.htmlContainer.loadRequest(htmlRequest)
    }
    
    @IBAction func startSurveyAction(sender: AnyObject) {
        self.startSurvey()
    }
    
    func startSurvey() {
        let taskViewController = ValuesSurveyTask.getTaskViewController()
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            // Enable tab bar
            let tabs = self.tabBarController?.tabBar.items
            let screeningTab = tabs![3]
            screeningTab.enabled = true
            
            
            let taskResult = taskViewController.result
            let researchKitHelper = ServiceManager.get("ResearchKitHelper") as! ResearchKitHelper
            let taskResultDict = researchKitHelper.dictFromTaskResult(taskResult)
            self.valuesSurveyModel.saveTaskResult(taskResultDict!)
            self.parentViewController?.viewDidAppear(false)
        default:
            print("Not completed")
        }
        
        // Then, dismiss the task view controller.
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}