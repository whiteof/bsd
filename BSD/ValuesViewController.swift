//
//  ValuesViewController.swift
//  BSD
//
//  Created by Viktar Yurkin on 6/13/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit
import ResearchKit

class ValuesViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    let questions = [
        "I'm willing to do anything to detect breast cancer as early as possible.",
        "Screening mammograms are painful and inconvenient.",
        "I only want to have mammograms if I am at high risk for breast cancer.",
        "I want my doctor to tell me when to have mammograms.",
        "I have enough information to make a decision about screening mammograms.",
        "Making a decision about when to start and how often to have mammograms is stressful.",
        "How worried are you about getting breast cancer?",
        "How concerned are you about the possible harms of screening mammograms?"
    ]
    let answers = [
        3,
        4,
        5,
        6,
        7,
        9,
        5,
        8
    ]
    let valuesSurveyModel = ServiceManager.get("ValuesSurveyModel") as! ValuesSurveyModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.updateView()
    }
    
    func updateView() {
        let valuesSurveyEntity = self.valuesSurveyModel.getValuesSurvey()
        
        if (valuesSurveyEntity.completed == false && valuesSurveyEntity.started == false) {
            self.startSurvey()
        }

    }
    
    @IBAction func resetSelections(sender: AnyObject) {
        self.startSurvey()
    }
    
    func startSurvey() {
        
        let valuesSurveyEntity = self.valuesSurveyModel.getValuesSurvey()
        valuesSurveyEntity.started = true
        self.valuesSurveyModel.setValuesSurvey(valuesSurveyEntity)
        
        let taskViewController = ValuesSurveyTask.getTaskViewController()
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }

    func taskViewController(taskViewController: ORKTaskViewController,
                            didFinishWithReason reason: ORKTaskViewControllerFinishReason,
                                                error: NSError?) {
        switch reason {
        case .Completed:
            let taskResult = taskViewController.result
            let researchKitHelper = ServiceManager.get("ResearchKitHelper") as! ResearchKitHelper
            let taskResultDict = researchKitHelper.dictFromTaskResult(taskResult)
            self.valuesSurveyModel.saveTaskResult(taskResultDict!)
        default:
            print("Not completed!")
        }
        
        // Then, dismiss the task view controller.
        //taskViewController.dismissViewControllerAnimated(true, completion: nil)
        taskViewController.dismissViewControllerAnimated(true, completion: updateView)
        
    }
    
}
