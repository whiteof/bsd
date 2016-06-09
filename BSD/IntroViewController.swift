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
        Settings.sharedInstance.completedSurvey = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if (Settings.sharedInstance.completedIntro == true && Settings.sharedInstance.completedSurvey == false) {
            
            var steps = [ORKStep]()
            /*
             let step0 = ORKInstructionStep(identifier: "intro")
             step0.title = "Your Decisions"
             step0.text = "When should you start and how often should you have mammograms to screen for breast cancer?"
             step0.detailText = "Should you start in your 40's or wait until you are 50?\n Should you have a mammogram every year or every other year?\n\n The first step in making these decisions is understanding your risk of breast cancer. Click \"Assess My Risk\" to continue."
             
             steps += [step0]
             */
            // This answer format will display a unit in-line with the numeric entry field.
            
            
            
            
            let step1 = ORKFormStep(identifier: "question1", title: NSLocalizedString("How Old Are You?", comment: ""), text: nil)
            let format1 = ORKAnswerFormat.decimalAnswerFormatWithUnit(NSLocalizedString("Your age", comment: ""))
            let item1 = ORKFormItem(identifier: "item1", text: "", answerFormat: format1)
            step1.formItems = [item1]
            steps += [step1]
            
            
            var textChoices = [
                NSLocalizedString("White", comment: ""),
                NSLocalizedString("African American", comment: ""),
                NSLocalizedString("Hispanic", comment: ""),
                NSLocalizedString("Asian or Pacific Islander", comment: ""),
                NSLocalizedString("American Indian or Alaskan Native", comment: ""),
                NSLocalizedString("Don't Know", comment: "")
            ]
            var choices: [ORKTextChoice] = []
            var i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            var step = ORKFormStep(identifier: "question2", title: NSLocalizedString("What is your race/ethnicity?", comment: ""), text: nil)
            var format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            var item = ORKFormItem(identifier: "item2", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]
            
            
            textChoices = [
                NSLocalizedString("7-11", comment: ""),
                NSLocalizedString("12-13", comment: ""),
                NSLocalizedString("14 or Older", comment: ""),
                NSLocalizedString("Don't Know", comment: ""),
            ]
            choices = []
            i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            step = ORKFormStep(identifier: "question3", title: NSLocalizedString("How old were you at your first menstrual period?", comment: ""), text: nil)
            format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            item = ORKFormItem(identifier: "item3", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]

            
            textChoices = [
                NSLocalizedString("Yes", comment: ""),
                NSLocalizedString("No", comment: ""),
            ]
            choices = []
            i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            step = ORKFormStep(identifier: "question4", title: NSLocalizedString("Have you had any children?", comment: ""), text: nil)
            format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            item = ORKFormItem(identifier: "item4", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]
            
            
            textChoices = [
                NSLocalizedString("Yes", comment: ""),
                NSLocalizedString("No", comment: ""),
                NSLocalizedString("Don't Know", comment: "")
            ]
            choices = []
            i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            step = ORKFormStep(identifier: "question5", title: NSLocalizedString("Have you ever had a breast biopsy?", comment: ""), text: nil)
            format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            item = ORKFormItem(identifier: "item5", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]
            
            
            textChoices = [
                NSLocalizedString("Yes", comment: ""),
                NSLocalizedString("No", comment: ""),
                NSLocalizedString("Don't Know", comment: "")
            ]
            choices = []
            i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            step = ORKFormStep(identifier: "question6", title: NSLocalizedString("Have you ever been diagnosed with atypical ductal hyperplasia of the breast?", comment: ""), text: nil)
            format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            item = ORKFormItem(identifier: "item6", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]
            
            
            
            textChoices = [
                NSLocalizedString("0", comment: ""),
                NSLocalizedString("1", comment: ""),
                NSLocalizedString("More Than 1", comment: ""),
                NSLocalizedString("Don't Know", comment: "")
            ]
            choices = []
            i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            step = ORKFormStep(identifier: "question7", title: NSLocalizedString("How many of your first-degree relatives (mother, sisters, daughters) have had breast cancer?", comment: ""), text: nil)
            format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            item = ORKFormItem(identifier: "item7", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]
            
            
            textChoices = [
                NSLocalizedString("Yes", comment: ""),
                NSLocalizedString("No", comment: ""),
                NSLocalizedString("Don't Know", comment: "")
            ]
            choices = []
            i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            step = ORKFormStep(identifier: "question8", title: NSLocalizedString("Have any of your first degree relatives (mother, sisters, daughters) had ovarian cancer?", comment: ""), text: nil)
            format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            item = ORKFormItem(identifier: "item8", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]
            
            
            textChoices = [
                NSLocalizedString("Yes", comment: ""),
                NSLocalizedString("No", comment: ""),
                NSLocalizedString("Don't Know", comment: "")
            ]
            choices = []
            i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            step = ORKFormStep(identifier: "question9", title: NSLocalizedString("Have you ever been diagnosed with breast cancer?", comment: ""), text: nil)
            format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            item = ORKFormItem(identifier: "item9", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]

            
            textChoices = [
                NSLocalizedString("Yes", comment: ""),
                NSLocalizedString("No", comment: ""),
                NSLocalizedString("Don't Know", comment: "")
            ]
            choices = []
            i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            step = ORKFormStep(identifier: "question10", title: NSLocalizedString("Have you ever been diagnosed with ductal carcinoma in situ (DCIS) or lobular carcinoma in situ (LCIS)?", comment: ""), text: nil)
            format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            item = ORKFormItem(identifier: "item10", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]
            
            
            textChoices = [
                NSLocalizedString("Yes", comment: ""),
                NSLocalizedString("No", comment: ""),
                NSLocalizedString("Don't Know", comment: "")
            ]
            choices = []
            i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            step = ORKFormStep(identifier: "question11", title: NSLocalizedString("Have you ever been told that you carry a genetic mutation for the BRCA1 or BRCA2 gene?", comment: ""), text: nil)
            format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            item = ORKFormItem(identifier: "item11", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]
            
            
            textChoices = [
                NSLocalizedString("Yes", comment: ""),
                NSLocalizedString("No", comment: ""),
                NSLocalizedString("Don't Know", comment: "")
            ]
            choices = []
            i = 0
            for textChoice in textChoices {
                i += 1
                choices.append(ORKTextChoice(text: textChoice, value: "choice_\(i)"))
            }
            step = ORKFormStep(identifier: "question12", title: NSLocalizedString("Have you ever had radiation therapy to the chest for another medical condition?", comment: ""), text: nil)
            format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
            item = ORKFormItem(identifier: "item12", text: "", answerFormat: format)
            step.formItems = [item]
            steps += [step]
            
            
            
            let task = ORKOrderedTask(identifier: "task", steps: steps)
            let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
            taskViewController.delegate = self
            presentViewController(taskViewController, animated: true, completion: setCompletedSurvey)
            
        }
        
        
        if (Settings.sharedInstance.completedSurvey) {
            let scaleStepIntro = ORKInstructionStep(identifier: "scaleStepIntro")
            scaleStepIntro.title = "Other things to think about"
            scaleStepIntro.text = "Every woman's feelings and concerns are different, and it may be helpful to think about what's important to you. The statements and questions below will give you a chance to explore your feelings about screening mammograms and breast cancer. There is no right or wrong answer."
            
            // The first step is a scale control with 10 discrete ticks.
            var scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
            scaleStep = ORKQuestionStep(identifier: "scaleQuestion1", title: "I'm willing to do anything to detect breast cancer as early as possible.", answer: scaleFormat)
            steps += [step1]

            
            let task = ORKOrderedTask(identifier: "scaleTask1", steps: [questionStep1])
            let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
            taskViewController.delegate = self
            presentViewController(taskViewController, animated: true, completion: nil)
        }
        
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
    
    @IBAction func enterAction(sender: AnyObject) {
        
        //let consentDocument = ConsentDocument()
        //let consentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
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
        
        /*
        let healthDataStep = HealthDataStep(identifier: "Health")
        
        let signature = consentDocument.signatures!.first!
        
        let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, inDocument: consentDocument)
        
        reviewConsentStep.text = "Review the consent form."
        reviewConsentStep.reasonForConsent = "Consent to join the Developer Health Research Study."
        
        let passcodeStep = ORKPasscodeStep(identifier: "Passcode")
        passcodeStep.text = "Now you will create a passcode to identify yourself to the app and protect access to information you've entered."
        
        let completionStep = ORKCompletionStep(identifier: "CompletionStep")
        completionStep.title = "Welcome aboard."
        completionStep.text = "Thank you for joining this study."
        */

        let passcodeStep = ORKPasscodeStep(identifier: "Passcode")
        passcodeStep.text = "Now you will create a passcode to identify yourself to the app and protect access to information you've entered."
        
        let completionStep = ORKCompletionStep(identifier: "CompletionStep")
        completionStep.title = "Welcome to Breast Screening Decisions!"
        completionStep.text = "Thank you for using this tool."
        
        //let orderedTask = ORKOrderedTask(identifier: "Join", steps: [consentStep, reviewConsentStep, healthDataStep, passcodeStep, completionStep])
        let orderedTask = ORKOrderedTask(identifier: "Join", steps: [consentStep, passcodeStep, completionStep])
        let taskViewController = ORKTaskViewController(task: orderedTask, taskRunUUID: nil)
        taskViewController.delegate = self
        
        presentViewController(taskViewController, animated: true, completion: setCompletedIntro)
        
    }
    
    func setCompletedIntro() {
        Settings.sharedInstance.completedIntro = true
    }
    
    func setCompletedSurvey() {
        Settings.sharedInstance.completedSurvey = true
    }
}
