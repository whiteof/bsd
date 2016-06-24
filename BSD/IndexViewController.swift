//
//  IndexViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 6/21/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import Foundation
import ResearchKit

class IndexViewController: UIViewController {
    // MARK: Propertues
    
    var contentHidden = false {
        didSet {
            guard contentHidden != oldValue && isViewLoaded() else { return }
            childViewControllers.first?.view.hidden = contentHidden
        }
    }
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func viewDidAppear(animated: Bool) {
        if ORKPasscodeViewController.isPasscodeStoredInKeychain() {
            toDashboard()
        }
        else {
            toIntro()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
    }
    
    func toIntro() {
        performSegueWithIdentifier("toIntro", sender: self)
    }
    
    func toDashboard() {
        performSegueWithIdentifier("toDashboard", sender: self)
    }
    
}

extension IndexViewController: ORKTaskViewControllerDelegate {
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
    }
}

