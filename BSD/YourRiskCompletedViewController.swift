//
//  YourRiskCompletedViewController.swift
//  BSD
//
//  Created by Viktar Yurkin on 6/23/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class YourRiskCompletedViewController: UIViewController {
    
    @IBOutlet weak var pieChart: UIScrollView!
    
    let riskSurveyModel = ServiceManager.get("RiskSurveyModel") as! RiskSurveyModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //let riskSurveyEntity = self.riskSurveyModel.getRiskSurvey()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildChart(frameWidth: CGFloat) {
        // Draw chart
        
        //let width = self.pieChart.frame.size.width
        let width = CGFloat(frameWidth-30.0)
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
        let labelY = CGFloat((figureHeight+1.0)*20.0)
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
    
}