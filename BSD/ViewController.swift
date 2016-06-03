//
//  ViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 6/3/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func taskViewController(taskViewController: ORKTaskViewController,
                            didFinishWithReason reason: ORKTaskViewControllerFinishReason,
                                                error: NSError?) {
        let taskResult = taskViewController.result
        print(taskResult)
        // You could do something with the result here.
        
        // Then, dismiss the task view controller.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func actionStartReview(sender: AnyObject) {

        var steps = [ORKStep]()
        /*
         let step1 = ORKInstructionStep(identifier: "intro")
         step1.title = "Welcome to ResearchKit"
         steps += [step1]
         */
        
        let step1 = ORKFormStep(identifier: "question1", title: NSLocalizedString("Major Goals and Accomplishments", comment: ""), text: NSLocalizedString("Describe your accomplishments over the past year. Have you met all of your goals from last year’s appraisal?  Do you feel you have met or exceeded expectations in all of your Position Activities?  Do you feel you need improvement in any Position Activities?  You may wish to highlight one particular achievement that you found particularly fulfilling, innovative, or creative.", comment: ""))
        let textarea1 = ORKTextAnswerFormat()
        let textareaItem1 = ORKFormItem(identifier: "textarea1", text: "", answerFormat: textarea1)
        step1.formItems = [textareaItem1]
        steps += [step1]
        
        let step2 = ORKFormStep(identifier: "question2", title: NSLocalizedString("Developmental Goals", comment: ""), text: NSLocalizedString("Describe any opportunities (e.g. training, growth, etc.) you would like to have. Explain how these would help you personally and/or help you make greater contributions to the mission.", comment: ""))
        let textarea2 = ORKTextAnswerFormat()
        let textareaItem2 = ORKFormItem(identifier: "textarea2", text: "", answerFormat: textarea2)
        step2.formItems = [textareaItem2]
        steps += [step2]
        
        let step3 = ORKFormStep(identifier: "question3", title: NSLocalizedString("Work Expectations", comment: ""), text: NSLocalizedString("Do you feel you know what is expected of you at work? If you are not clear on your assignments, what can your supervisor do to help you with this?", comment: ""))
        let textarea3 = ORKTextAnswerFormat()
        let textareaItem3 = ORKFormItem(identifier: "textarea3", text: "", answerFormat: textarea3)
        step3.formItems = [textareaItem3]
        steps += [step3]
        
        let step4 = ORKFormStep(identifier: "question4", title: NSLocalizedString("Work Needs", comment: ""), text: NSLocalizedString("Do you have everything you need to get your job done? Is there anything else that could make you more efficient or productive?", comment: ""))
        let textarea4 = ORKTextAnswerFormat()
        let textareaItem4 = ORKFormItem(identifier: "textarea4", text: "", answerFormat: textarea4)
        step4.formItems = [textareaItem4]
        steps += [step4]
        
        let step5 = ORKFormStep(identifier: "question5", title: NSLocalizedString("User Experience and User Service", comment: ""), text: NSLocalizedString("What ideas do you have for how to improve the user experience and service delivery at WCM?", comment: ""))
        let textarea5 = ORKTextAnswerFormat()
        let textareaItem5 = ORKFormItem(identifier: "textarea5", text: "", answerFormat: textarea5)
        step4.formItems = [textareaItem5]
        steps += [step5]
        
        let step6 = ORKFormStep(identifier: "question6", title: NSLocalizedString("Performance Feedback", comment: ""), text: NSLocalizedString("Is there anyone inside or outside the department that you think should provide important feedback about your performance this year?", comment: ""))
        let textarea6 = ORKTextAnswerFormat()
        let textareaItem6 = ORKFormItem(identifier: "textarea6", text: "", answerFormat: textarea6)
        step6.formItems = [textareaItem6]
        steps += [step6]
        
        let step7 = ORKFormStep(identifier: "question7", title: NSLocalizedString("Peer Recognition", comment: ""), text: NSLocalizedString("Is there someone else in the department you think gets insufficient recognition for the excellent work he/she does? if so, who, and provide reasons why the person should be recognized(as an above and beyond duties employee)", comment: ""))
        let textarea7 = ORKTextAnswerFormat()
        let textareaItem7 = ORKFormItem(identifier: "textarea7", text: "", answerFormat: textarea7)
        step7.formItems = [textareaItem7]
        steps += [step7]
        
        
        let task = ORKOrderedTask(identifier: "task", steps: steps)
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
        
    }
    
}

