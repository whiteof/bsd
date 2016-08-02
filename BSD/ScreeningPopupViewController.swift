//
//  ScreeningPopupViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 8/2/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class ScreeningPopupViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var htmlContainer: UIWebView!
    
    let baseUrl: NSURL = {
        let path = NSBundle.mainBundle().bundlePath
        let url = NSURL.fileURLWithPath(path)
        return url
    }()
        
    var htmlRequest: NSURLRequest? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (self.htmlRequest != nil) {
            self.htmlContainer.loadRequest(self.htmlRequest!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopup(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.LinkClicked {
            UIApplication.sharedApplication().openURL(request.URL!)
            return false
        }
        return true
    }
}
