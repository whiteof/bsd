//
//  ORKQuestionResult.swift
//  BSD
//
//  Created by Victor Yurkin on 6/20/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import ResearchKit

extension ORKQuestionResult {
    
    func stringValue() -> String {
        
        var retString = "None"
        switch self.questionType {
        case .None:
            retString = "None"
        case .Scale:
            retString = (self as! ORKScaleQuestionResult).scaleAnswer?.description ?? "Skipped"
        case .SingleChoice:
            fallthrough
        case .MultipleChoice:
            retString = (self as! ORKChoiceQuestionResult).choiceAnswers?.description ?? "Skipped"
        case .Decimal:
            fallthrough
        case .Integer:
            retString = (self as! ORKNumericQuestionResult).numericAnswer?.description ?? "Skipped"
        case .Boolean:
            fallthrough
        case .Text:
            retString = (self as! ORKTextQuestionResult).textAnswer ?? "Skipped"
        case .TimeOfDay:
            retString = (self as! ORKTimeOfDayQuestionResult).dateComponentsAnswer?.description ?? "Skipped"
        case .DateAndTime:
            fallthrough
        case .Date:
            retString = (self as! ORKDateQuestionResult).dateAnswer?.description ?? "Skipped"
        case .TimeInterval:
            retString = (self as! ORKTimeIntervalQuestionResult).intervalAnswer?.description ?? "Skipped"
        case .Location:
            retString = (self as! ORKLocationQuestionResult).locationAnswer?.description ?? "Skipped"
        }
        return retString
    }
    
}
