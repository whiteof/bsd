//
//  IntroViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 6/6/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit
import ResearchKit

class IntroViewController: UIViewController, ORKTaskViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        //let taskResult = taskViewController.result
        switch reason {
        case .Completed:
            performSegueWithIdentifier("unwindToDashboard", sender: self)
        case .Discarded, .Failed, .Saved:
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func enterAction(sender: AnyObject) {
        
        let consentDocument = ORKConsentDocument()

        let section1 = ORKConsentSection(type: .StudySurvey)
        section1.title = "Your Decisions"
        section1.summary = "When should you start and how often should you have mammograms to screen for breast cancer?";
        section1.content = "When should you start and how often should you have mammograms to screen for breast cancer?\n\nShould you start in your 40's or wait until you are 50?\n\nShould you have a mammogram every year or every other year?\n\nThe first step in making these decisions is understanding your risk of breast cancer.";
        section1.customLearnMoreButtonTitle = "Learn more"
        
        let section2 = ORKConsentSection(type: .Privacy)
        section2.title = "Privacy"
        section2.summary = "Information you enter here is anonymous, and we never ask your name or email address.";
        
        consentDocument.sections = [section1, section2]
        let consentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
        
        let passcodeStep = ORKPasscodeStep(identifier: "Passcode")
        passcodeStep.text = "Now you will create a passcode to identify yourself to the app and protect access to information you've entered."
        
        let completionStep = ORKCompletionStep(identifier: "CompletionStep")
        completionStep.title = "Welcome to Breast Screening Decisions!"
        completionStep.text = "Thank you for using this tool."
        
        //let orderedTask = ORKOrderedTask(identifier: "Join", steps: [consentStep, reviewConsentStep, healthDataStep, passcodeStep, completionStep])
        let orderedTask = ORKOrderedTask(identifier: "Join", steps: [consentStep, passcodeStep, completionStep])
        let taskViewController = ORKTaskViewController(task: orderedTask, taskRunUUID: nil)
        taskViewController.modalPresentationStyle = .OverCurrentContext
        taskViewController.delegate = self
        
        presentViewController(taskViewController, animated: true, completion: nil)
        
    }
    
}
