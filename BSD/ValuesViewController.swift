//
//  ValuesViewController.swift
//  BSD
//
//  Created by Viktar Yurkin on 6/13/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit
import ResearchKit

class ValuesViewController: UIViewController, ORKTaskViewControllerDelegate, UITableViewDelegate, UITableViewDataSource  {
    
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
    @IBOutlet weak var answersTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.answersTable.separatorStyle = .None
        self.answersTable.rowHeight = 80.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.startSurvey()
    }
    
    @IBAction func resetSelections(sender: AnyObject) {
        self.startSurvey()
    }
    
    func startSurvey() {
        var scaleSteps = [ORKStep]()
        
        let scaleStepIntro = ORKInstructionStep(identifier: "scaleStepIntro")
        scaleStepIntro.title = "Other things to think about"
        scaleStepIntro.text = "Every woman's feelings and concerns are different, and it may be helpful to think about what's important to you. The statements and questions below will give you a chance to explore your feelings about screening mammograms and breast cancer. There is no right or wrong answer."
        scaleSteps += [scaleStepIntro]
        
        var scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        var scaleStep = ORKQuestionStep(identifier: "scaleQuestion1", title: "I'm willing to do anything to detect breast cancer as early as possible.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "scaleQuestion2", title: "Screening mammograms are painful and inconvenient.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "scaleQuestion3", title: "I only want to have mammograms if I am at high risk for breast cancer.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "scaleQuestion4", title: "I want my doctor to tell me when to have mammograms.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "scaleQuestion5", title: "I have enough information to make a decision about screening mammograms.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "scaleQuestion6", title: "Making a decision about when to start and how often to have mammograms is stressful.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "scaleQuestion7", title: "How worried are you about getting breast cancer?", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "scaleQuestion8", title: "How concerned are you about the possible harms of screening mammograms?", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        let task = ORKOrderedTask(identifier: "scaleTask1", steps: scaleSteps)
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
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
    
    // TableView functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.questions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("valuesCell", forIndexPath: indexPath)
        
        for view in cell.contentView.subviews {
            if view.isKindOfClass(UILabel) {
                let question = view as! UILabel
                if question.restorationIdentifier == "cellTitle" {
                    question.text = self.questions[indexPath.row]
                }
            }
            if view.isKindOfClass(UIProgressView) {
                let answer = view as! UIProgressView
                let value = (Float(self.answers[indexPath.row]) / 10)
                answer.progress = Float(value)
            }
        }

        
        if(indexPath.row == 0) {
            //let cellImg = UIImageView(frame: CGRectMake(5, 5, 50, 50))
            //cellImg.image = UIImage(named: "Figure")
            //cell.addSubview(cellImg)
            //cell.textLabel?.text = "Unit testing: 03/23/2016 5:05am"
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender is UITableViewCell {
            let nextScene = segue.destinationViewController as! ValuesDetailViewController
            if let indexPath = self.answersTable.indexPathForSelectedRow {
                nextScene.question = self.questions[indexPath.row]
                nextScene.value = self.answers[indexPath.row]
            }
        }
    }
    
}
