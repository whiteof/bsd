//
//  ValuesDetailViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 6/17/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class ValuesDetailViewController: UIViewController {
    
    var question: String!
    var value: Int!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.titleLabel.text = self.question
        let progressVal = (Float(self.value) / 10)
        self.progressBar.progress = Float(progressVal)
        self.valueLabel.text = "Value: \(self.value)"
        
        // Set round corners
        self.progressBar.layer.cornerRadius = 8
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func closeAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
