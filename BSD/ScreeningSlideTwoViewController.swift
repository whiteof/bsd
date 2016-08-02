//
//  ScreeningSlideTwoViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 8/2/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class ScreeningSlideTwoViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var htmlContainer: UIWebView!
    
    let baseUrl: NSURL = {
        let path = NSBundle.mainBundle().bundlePath
        let url = NSURL.fileURLWithPath(path)
        return url
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Do any additional setup after loading the view.
        var htmlHeader: String = ""
        var htmlBody: String = ""
        var htmlFooter: String = ""
        var htmlString: String = ""
        var fileLocation: String = ""
        
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
        fileLocation = NSBundle.mainBundle().pathForResource("screeningPage2", ofType: "html")!
        do {
            htmlBody = try String(contentsOfFile: fileLocation)
        } catch {
            htmlBody = ""
        }
        
        htmlString = htmlHeader + htmlBody + htmlFooter
        
        self.htmlContainer.loadHTMLString(htmlString, baseURL: self.baseUrl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

}
