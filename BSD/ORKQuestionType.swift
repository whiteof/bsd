//
//  ORKQuestionType.swift
//  BSD
//
//  Created by Victor Yurkin on 6/20/16.
//  Copyright © 2016 WCM. All rights reserved.
//
import ResearchKit

extension ORKQuestionType {
    
    func stringValue() -> String {
        var retString = "None"
        switch self {
        case .None:
            retString = "None"
        case .Scale:
            retString = "Scale"
        case .SingleChoice:
            retString = "SingleChoice"
        case .MultipleChoice:
            retString = "MultipleChoice"
        case .Decimal:
            retString = "Decimal"
        case .Integer:
            retString = "Integer"
        case .Boolean:
            retString = "Boolean"
        case .Text:
            retString = "Text"
        case .TimeOfDay:
            retString = "TimeOfDay"
        case .DateAndTime:
            retString = "DateAndTime"
        case .Date:
            retString = "Date"
        case .TimeInterval:
            retString = "TimeInterval"
        case .Location:
            retString = "Location"
        }
        return retString
    }
    
}