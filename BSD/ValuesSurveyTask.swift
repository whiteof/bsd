//
//  ValuesSurveyTask.swift
//  BSD
//
//  Created by Victor Yurkin on 6/24/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit
import ResearchKit

class ValuesSurveyTask {
    
    class func getTaskViewController() -> ORKTaskViewController {
        
        var scaleSteps = [ORKStep]()
        
        let scaleStepIntro = ORKInstructionStep(identifier: "scaleStepIntro")
        scaleStepIntro.title = "Other things to think about"
        scaleStepIntro.text = "Every woman's feelings and concerns are different, and it may be helpful to think about what's important to you. The statements and questions below will give you a chance to explore your feelings about screening mammograms and breast cancer. There is no right or wrong answer."
        scaleSteps += [scaleStepIntro]
        
        var scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        var scaleStep = ORKQuestionStep(identifier: "question1", title: "I'm willing to do anything to detect breast cancer as early as possible.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "question2", title: "Screening mammograms are painful and inconvenient.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "question3", title: "I only want to have mammograms if I am at high risk for breast cancer.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "question4", title: "I want my doctor to tell me when to have mammograms.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "question5", title: "I have enough information to make a decision about screening mammograms.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "question6", title: "Making a decision about when to start and how often to have mammograms is stressful.", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "question7", title: "How worried are you about getting breast cancer?", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        scaleFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(10, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: false, maximumValueDescription: "Strongly Agree", minimumValueDescription: "Strongly Disagree")
        scaleStep = ORKQuestionStep(identifier: "question8", title: "How concerned are you about the possible harms of screening mammograms?", answer: scaleFormat)
        scaleSteps += [scaleStep]
        
        let task = ORKOrderedTask(identifier: "task", steps: scaleSteps)
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskViewController.modalPresentationStyle = .OverCurrentContext
        
        return taskViewController
    }

}