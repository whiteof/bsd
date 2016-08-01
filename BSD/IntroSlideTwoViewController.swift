//
//  IntroSlideTwoViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 8/1/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class IntroSlideTwoViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var htmlContainer: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
    
        // Do any additional setup after loading the view.
        var htmlHeader: String = ""
        var htmlBody: String = ""
        var htmlFooter: String = ""
        var htmlString: String = ""
        var fileLocation: String = ""
        
        // Get HTML Header
        fileLocation = NSBundle.mainBundle().pathForResource("IntroHeader", ofType: "html")!
        do {
            htmlHeader = try String(contentsOfFile: fileLocation)
        } catch {
            htmlHeader = ""
        }
        
        // Get HTML Footer
        fileLocation = NSBundle.mainBundle().pathForResource("IntroFooter", ofType: "html")!
        do {
            htmlFooter += try String(contentsOfFile: fileLocation)
        } catch {
            htmlFooter += ""
        }
        
        // Get HTML Body
        fileLocation = NSBundle.mainBundle().pathForResource("IntroPage2", ofType: "html")!
        do {
            htmlBody = try String(contentsOfFile: fileLocation)
        } catch {
            htmlBody = ""
        }
        
        htmlString = htmlHeader + htmlBody + htmlFooter
        do {
            try htmlString.writeToFile(fileLocation, atomically: false, encoding: NSUTF8StringEncoding)
        } catch {
            print("ERROR!!!")
        }
        let localfilePath = NSBundle.mainBundle().URLForResource("IntroPage2", withExtension: "html");
        let myRequest = NSURLRequest(URL: localfilePath!)
        self.htmlContainer.loadRequest(myRequest);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (navigationType == UIWebViewNavigationType.LinkClicked){
            webView.stopLoading()
            let popupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("introPopupViewController") as! IntroPopupViewController
            popupViewController.modalPresentationStyle = .OverCurrentContext
            popupViewController.htmlRequest = NSURLRequest(URL: request.URL!)
            presentViewController(popupViewController, animated: true, completion: nil)
        }
        
        return true
    }
}
