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

    
    @IBOutlet weak var pieChart: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.pieChart.dataSource = pieChartDataSource
    }

    let pieChartDataSource = PieChartDataSource()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetAction(sender: AnyObject) {
        Settings.sharedInstance.completedSurvey = false
        self.startSurvey()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Draw chart
        if (Settings.sharedInstance.completedSurvey == true) {
            let width = self.pieChart.frame.size.width
            let figureWidth = (Float(width)/50)
            let figureHeight = figureWidth*1.6
            for j in 0...19 {
                for i in 0...49 {
                    var image: UIImage!
                    if j == 0 && i < 8 {
                        image = UIImage(named: "Chart Figure Active")
                    }else {
                        image = UIImage(named: "Chart Figure")
                    }
                    let imageView = UIImageView(image: image)
                    imageView.frame = CGRect(x: (i*Int(figureWidth)), y: j*Int(figureHeight+1.0), width: Int(figureWidth-1.0), height: Int(figureHeight))
                    self.pieChart.addSubview(imageView)
                }
            }

            // Add Labels
            let labelY = CGFloat((figureHeight+1.0)*19.0)
            let label1 = UILabel(frame: CGRectMake(0, labelY, width, 20))
            label1.font = UIFont(name: label1.font.fontName, size: 14)
            label1.text = "In the next 5 years:"
            self.pieChart.addSubview(label1)

            let label2 = UILabel(frame: CGRectMake(20, (labelY + 20.0), width, 20))
            label2.font = UIFont(name: label2.font.fontName, size: 12)
            label2.text = "992 will not get breast cancer"
            self.pieChart.addSubview(label2)

            let label3 = UILabel(frame: CGRectMake(20, (labelY + 35.0), width, 20))
            label3.font = UIFont(name: label3.font.fontName, size: 12)
            label3.text = "8 will get breast cancer"
            label3.textColor = UIColor.redColor()
            self.pieChart.addSubview(label3)

            let someView = UIView(frame: CGRect(x: 0, y: 0, width: Int(width), height: Int((figureHeight+1.0)*19.0+60.0)))
            self.pieChart.contentSize = someView.frame.size
        }
        
        if(Settings.sharedInstance.completedIntro == false) {
            let IntroViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("IntroViewController")
            presentViewController(IntroViewController, animated: true, completion: nil)
        }
        
        if (Settings.sharedInstance.completedIntro == true && Settings.sharedInstance.completedSurvey == false) {
            self.startSurvey()
        }
        
    }
    
    func startSurvey() {
        var steps = [ORKStep]()
        
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
    
    func taskViewController(taskViewController: ORKTaskViewController,
                            didFinishWithReason reason: ORKTaskViewControllerFinishReason,
                                                error: NSError?) {
        let taskResult = taskViewController.result
        print(taskResult)
        // You could do something with the result here.
        
        // Then, dismiss the task view controller.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setCompletedSurvey() {
        Settings.sharedInstance.completedSurvey = true
    }
    
}
