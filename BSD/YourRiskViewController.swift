//
//  YourRiskViewController.swift
//  BSD
//
//  Created by Viktar Yurkin on 6/13/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit
import ResearchKit

class YourRiskViewController: UIViewController, ORKTaskViewControllerDelegate {

    
    @IBOutlet weak var accessButton: UIButton!
    @IBOutlet weak var viewContainer: UIScrollView!
    
    let riskSurveyModel = ServiceManager.get("RiskSurveyModel") as! RiskSurveyModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.pieChart.dataSource = pieChartDataSource
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetAction(sender: UIButton) {
        self.startSurvey()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let riskSurveyEntity = self.riskSurveyModel.getRiskSurvey()
        if (riskSurveyEntity.completed == true) {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("riskViewCompleted") as! YourRiskCompletedViewController
            for view in viewController.view.subviews {
                if view.isKindOfClass(UIButton) {
                    let button = view as! UIButton
                    button.addTarget(self, action: #selector(self.resetAction(_:)), forControlEvents: .TouchUpInside)
                }
            }
            viewController.view.frame.size.width = self.viewContainer.frame.size.width
            viewController.view.frame.size.height = self.viewContainer.frame.size.height
            addChildViewController(viewController)
            self.viewContainer.addSubview(viewController.view)
            viewController.didMoveToParentViewController(self)
            viewController.buildChart(self.viewContainer.frame.size.width)
        }else {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("riskViewStarted") as! YourRiskStartedViewController
            if (riskSurveyEntity.started == true) {
                for view in viewController.view.subviews {
                    if view.isKindOfClass(UIButton) {
                        let button = view as! UIButton
                        button.addTarget(self, action: #selector(self.restartSurvey(_:)), forControlEvents: .TouchUpInside)
                    }
                }
                viewController.view.frame.size.width = self.viewContainer.frame.size.width
                viewController.view.frame.size.height = self.viewContainer.frame.size.height
                addChildViewController(viewController)
                self.viewContainer.addSubview(viewController.view)
                viewController.didMoveToParentViewController(self)
            }else {
                self.startSurvey()
            }
        }
 
    }
    
    func restartSurvey(sender: UIButton!) {
        self.startSurvey()
    }
    
    func startSurvey() {
        
        let riskSurveyEntity = self.riskSurveyModel.getRiskSurvey()
        riskSurveyEntity.started = true
        self.riskSurveyModel.setRiskSurvey(riskSurveyEntity)
        
        var steps = [ORKStep]()
        
        let step1 = ORKFormStep(identifier: "question1", title: NSLocalizedString("How Old Are You?", comment: ""), text: nil)
        step1.optional = false
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
        step.optional = false
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
        step.optional = false
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
        step.optional = false
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
        step.optional = false
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
        step.optional = false
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
        step.optional = false
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
        step.optional = false
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
        step.optional = false
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
        step.optional = false
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
        step.optional = false
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
        step.optional = false
        format = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: choices)
        item = ORKFormItem(identifier: "item12", text: "", answerFormat: format)
        step.formItems = [item]
        steps += [step]
        
        let task = ORKOrderedTask(identifier: "task", steps: steps)
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskViewController.delegate = self
        taskViewController.modalPresentationStyle = .OverCurrentContext
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
        switch reason {
        case .Completed:
            let taskResult = taskViewController.result
            let researchKitHelper = ServiceManager.get("ResearchKitHelper") as! ResearchKitHelper
            let taskResultDict = researchKitHelper.dictFromTaskResult(taskResult)
            self.riskSurveyModel.saveTaskResult(taskResultDict!)
            self.viewDidAppear(false)
        default:
            print("Not completed!")
        }
        
        // Then, dismiss the task view controller.
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
}