//
//  YourRiskViewController.swift
//  BSD
//
//  Created by Viktar Yurkin on 6/13/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit
import ResearchKit

class YourRiskViewController: UIViewController, UIWebViewDelegate, ORKTaskViewControllerDelegate {

    @IBOutlet weak var htmlContainer: UIWebView!
    @IBOutlet weak var surveyButton: UIButton!
    
    let riskSurveyModel = ServiceManager.get("RiskSurveyModel") as! RiskSurveyModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let json = [
            "age":40,
            "ageFirstMenstrualPeriod":"7-11",
            "ageFirstLiveBirth":"<20",
            "anyChildren":"YES",
            "anyfirstDegreeRelativesBreastCancerUnder50":"",
            "everDiagnosedBRCA1BRCA2":"NO",
            "everDiagnosedBreastCancer":"NO",
            "everDiagnosedDCISLCIS":"NO",
            "everHadBreastBiopsy":"NO",
            "everHadHyperplasia":"NO",
            "everHadRadiationTherapy":"NO",
            "firstDegreeRelativesBreastCancer":"0",
            "firstDegreeRelativesOvarian":"NO",
            "howManyBreastBiopsy":"",
            "race":"WHITE",
            "raceAPI":"",
            "raceProcessed":"WHITE",
            "ageFirstLiveBirthProcessed":"<20",
            "howManyBreastBiopsyProcessed":"NA"
        ]
        //let result = self.getRiskAssessed(json)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let riskSurveyEntity = self.riskSurveyModel.getRiskSurvey()
        if (riskSurveyEntity.completed == true) {
            
            // Get HTML Chart
            let chartHtml = self.buildChart(self.htmlContainer.frame.width)
            let contentHtml = self.buildContent()

            // Get HTML
            var htmlBody = ""
            let fileLocation = NSBundle.mainBundle().pathForResource("YourRiskCompleted", ofType: "html")!
            do {
                htmlBody = try String(contentsOfFile: fileLocation)
                htmlBody = htmlBody.stringByReplacingOccurrencesOfString("[dynamicImages]", withString: chartHtml)
                htmlBody = htmlBody.stringByReplacingOccurrencesOfString("[dynamicContent]", withString: contentHtml)
            } catch {
                htmlBody = ""
            }

            let basePath = NSBundle.mainBundle().bundlePath
            let baseUrl = NSURL.fileURLWithPath(basePath)
            
            self.htmlContainer.loadHTMLString(htmlBody, baseURL: baseUrl)
            
            // Set button title
            self.surveyButton.setTitle("Resset Selections", forState: UIControlState.Normal)

        }else {
            
            // Get and load HTML
            let localfilePath = NSBundle.mainBundle().URLForResource("YourRiskIndex", withExtension: "html")
            let htmlRequest = NSURLRequest(URL: localfilePath!)
            self.htmlContainer.loadRequest(htmlRequest)
            
            // Set button title
            self.surveyButton.setTitle("Access My Risk", forState: UIControlState.Normal)
            
            if (riskSurveyEntity.started == false) {
                //self.startSurvey()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func surveyButtonAction(sender: AnyObject) {
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

            // Enable tab bar
            let tabs = self.tabBarController?.tabBar.items
            let screeningTab = tabs![1]
            screeningTab.enabled = true
            let valuesTab = tabs![2]
            valuesTab.enabled = true
            
            let taskResult = taskViewController.result
            let researchKitHelper = ServiceManager.get("ResearchKitHelper") as! ResearchKitHelper
            let taskResultDict = researchKitHelper.dictFromTaskResult(taskResult)
            self.riskSurveyModel.saveTaskResult(taskResultDict!)
            self.viewDidAppear(false)
            
            let json = [
                "age":40,
                "ageFirstMenstrualPeriod":"7-11",
                "ageFirstLiveBirth":"<20",
                "anyChildren":"YES",
                "anyfirstDegreeRelativesBreastCancerUnder50":"",
                "everDiagnosedBRCA1BRCA2":"NO",
                "everDiagnosedBreastCancer":"NO",
                "everDiagnosedDCISLCIS":"NO",
                "everHadBreastBiopsy":"NO",
                "everHadHyperplasia":"NO",
                "everHadRadiationTherapy":"NO",
                "firstDegreeRelativesBreastCancer":"0",
                "firstDegreeRelativesOvarian":"NO",
                "howManyBreastBiopsy":"",
                "race":"WHITE",
                "raceAPI":"",
                "raceProcessed":"WHITE",
                "ageFirstLiveBirthProcessed":"<20",
                "howManyBreastBiopsyProcessed":"NA"
            ]
            let result = self.getRiskAssessed(json)
            print(result)
        default:
            print("Not completed!")
        }
        
        // Then, dismiss the task view controller.
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (navigationType == UIWebViewNavigationType.LinkClicked){
            print(request.URL?.absoluteString)
            if (request.URL?.absoluteString.rangeOfString("http") != nil) {
                print("shared")
                UIApplication.sharedApplication().openURL(request.URL!)
                return false
            }else {
                webView.stopLoading()
                let popupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("screeningPopupViewController") as! ScreeningPopupViewController
                popupViewController.modalPresentationStyle = .OverCurrentContext
                popupViewController.htmlRequest = NSURLRequest(URL: request.URL!)
                presentViewController(popupViewController, animated: true, completion: nil)
            }
        }
        
        return true
    }
    
    func buildChart(frameWidth: CGFloat) -> String {
        // Draw chart
        var returnHtml = ""
        
        //let width = self.pieChart.frame.size.width
        let width = CGFloat(frameWidth-30.0)
        let figureWidth = (Float(width)/50)
        let figureHeight = figureWidth*1.6
        for j in 0...19 {
            for i in 0...49 {
                var image: String!
                if j == 0 && i < 8 {
                    image = "<img class=\"figure\" src=\"small_figure.png\" style=\"width: \(Int(figureWidth-1.0))px; height: \(Int(figureHeight))px;\">"
                }else {
                    image = "<img class=\"figure\" src=\"small_figure.png\" style=\"width: \(Int(figureWidth-1.0))px; height: \(Int(figureHeight))px; opacity: 0.5;\">"
                }
                returnHtml += image
            }
            returnHtml += "<br />"
        }
        
        return returnHtml
    }
 
    func buildContent() -> String {
        var returnHtml = ""
        
        returnHtml += "<p style=\"font-size: 12px;\">In the next 5 years, <strong>992</strong> will not get breast cancer.</p>"
        returnHtml += "<p style=\"font-size: 12px; color: #BD1C6E;\">In the next 5 years, <strong style=\"color: #BD1C6E;\">8</strong> will get breast cancer.</p>"
        
        return returnHtml
    }
    
    func getRiskAssessed(json: [String: NSObject]) -> Any? {
        
        do {
            
            let jsonData = try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
            
            // create post request
            let url = NSURL(string: "http://140.251.10.20/get-risk/index.cfm")!
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            
            // insert json data to the request
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = jsonData
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
                if error != nil{
                    //print("Error -> \(error)")
                    return
                }
                do {
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String:AnyObject]
                    //print("Result -> \(result)")
                } catch {
                    //print("Error -> \(error)")
                }
            }
            
            task.resume()

            //print("***************************")
            //print(task)
            //print("***************************")
            
        } catch {
            //print(error)
        }
        
        
        return nil
    }
    
}