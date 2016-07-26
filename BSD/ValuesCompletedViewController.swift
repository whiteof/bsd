//
//  ValuesCompletedViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 6/24/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit
import ResearchKit

class ValuesCompletedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ORKTaskViewControllerDelegate {
    
    let valuesSurveyModel = ServiceManager.get("ValuesSurveyModel") as! ValuesSurveyModel
    
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
    
    var answers: [Int] = {
        let valuesSurveyModel = ServiceManager.get("ValuesSurveyModel") as! ValuesSurveyModel
        let valuesSurveyEntity = valuesSurveyModel.getValuesSurvey()
        var returnArray = [Int]()
        if valuesSurveyEntity.completed == true {
            returnArray = [valuesSurveyEntity.question1, valuesSurveyEntity.question2, valuesSurveyEntity.question3, valuesSurveyEntity.question4, valuesSurveyEntity.question5, valuesSurveyEntity.question6, valuesSurveyEntity.question7, valuesSurveyEntity.question8]
        }else {
            returnArray = [0, 0, 0, 0, 0, 0, 0, 0]
        }
        return returnArray
    }()

    @IBOutlet weak var answersTable: UITableView!
    
    @IBAction func resetAction(sender: AnyObject) {
        let taskViewController = ValuesSurveyTask.getTaskViewController()
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.answersTable.separatorStyle = .None
        self.answersTable.rowHeight = 80.0
    }
    
    override func viewDidAppear(animated: Bool) {
        let valuesSurveyEntity = self.valuesSurveyModel.getValuesSurvey()
        self.answers = [valuesSurveyEntity.question1, valuesSurveyEntity.question2, valuesSurveyEntity.question3, valuesSurveyEntity.question4, valuesSurveyEntity.question5, valuesSurveyEntity.question6, valuesSurveyEntity.question7, valuesSurveyEntity.question8]
        self.answersTable.reloadData()
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

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("valuesDetailViewController") as! ValuesDetailViewController
        detailViewController.modalPresentationStyle = .OverCurrentContext
        detailViewController.question = self.questions[indexPath.row]
        detailViewController.value = self.answers[indexPath.row]
        presentViewController(detailViewController, animated: true, completion: nil)
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            let taskResult = taskViewController.result
            let researchKitHelper = ServiceManager.get("ResearchKitHelper") as! ResearchKitHelper
            let taskResultDict = researchKitHelper.dictFromTaskResult(taskResult)
            self.valuesSurveyModel.saveTaskResult(taskResultDict!)

            let valuesSurveyEntity = self.valuesSurveyModel.getValuesSurvey()
            self.answers = [valuesSurveyEntity.question1, valuesSurveyEntity.question2, valuesSurveyEntity.question3, valuesSurveyEntity.question4, valuesSurveyEntity.question5, valuesSurveyEntity.question6, valuesSurveyEntity.question7, valuesSurveyEntity.question8]
            
            self.answersTable.reloadData()
        default:
            print("Not completed!")
        }
        
        // Then, dismiss the task view controller.
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}