//
//  CommonNavigationController.swift
//  BSD
//
//  Created by Victor Yurkin on 8/29/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class CommonNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationBar.barTintColor = UIColor(red: 185/255, green: 29/255, blue: 107/255, alpha: 1.0)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
