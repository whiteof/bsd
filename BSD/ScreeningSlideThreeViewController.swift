//
//  ScreeningSlideThreeViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 7/26/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class ScreeningSlideThreeViewController: UIViewController {

    
    @IBOutlet weak var htmlContainer: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var htmlHeader: String = ""
        var htmlBody: String = ""
        var htmlFooter: String = ""
        var htmlString: String = ""
        var fileLocation: String = ""
        
        // Get HTML Chart
        let chartHtml = buildChart(self.htmlContainer.frame.width)
        
        // Get HTML Header
        fileLocation = NSBundle.mainBundle().pathForResource("screeningHeader", ofType: "html")!
        do {
            htmlHeader = try String(contentsOfFile: fileLocation)
        } catch {
            htmlHeader = ""
        }
        
        // Get HTML Footer
        fileLocation = NSBundle.mainBundle().pathForResource("screeningFooter", ofType: "html")!
        do {
            htmlFooter += try String(contentsOfFile: fileLocation)
        } catch {
            htmlFooter += ""
        }
        
        // Get HTML Body
        fileLocation = NSBundle.mainBundle().pathForResource("screeningPage3", ofType: "html")!
        do {
            htmlBody = try String(contentsOfFile: fileLocation)
            htmlBody = htmlBody.stringByReplacingOccurrencesOfString("[dynamicImages]", withString: chartHtml)
        } catch {
            htmlBody = ""
        }
        
        htmlString = htmlHeader + htmlBody + htmlFooter
        do {
            try htmlString.writeToFile(fileLocation, atomically: false, encoding: NSUTF8StringEncoding)
        } catch {
            print("ERROR!!!")
        }
        let localfilePath = NSBundle.mainBundle().URLForResource("screeningPage3", withExtension: "html");
        let myRequest = NSURLRequest(URL: localfilePath!);
        self.htmlContainer.loadRequest(myRequest);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buildChart(frameWidth: CGFloat) -> String {
        // Draw chart
        var returnHtml = ""
        
        //let width = self.pieChart.frame.size.width
        let width = CGFloat(frameWidth-30.0)
        let figureWidth = (Float(width)/80)
        let figureHeight = figureWidth*1.6
        for j in 0...19 {
            for i in 0...49 {
                var image: String!
                if j == 0 && i < 8 {
                    image = "<img src=\"small_figure.png\" style=\"width: \(Int(figureWidth-1.0))px; height: \(Int(figureHeight))px;\">"
                }else {
                    image = "<img src=\"small_figure.png\" style=\"width: \(Int(figureWidth-1.0))px; height: \(Int(figureHeight))px; opacity: 0.5;\">"
                }
                returnHtml += image
            }
            returnHtml += "<br />"
        }
        
        return returnHtml
    }
    
}
