//
//  IntroSlidesViewController.swift
//  BSD
//
//  Created by Viktar Yurkin on 6/7/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class IntroSlidesViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    let pageViewControllers: [UIViewController] = {
        let introOne = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("introOneViewController")
        let introTwo = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("introTwoViewController")
        let introThree = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("introThreeViewController")
        return [introOne, introTwo, introThree]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        dataSource = self
        setViewControllers([pageViewControllers[0]], direction: .Forward, animated: false, completion: nil)
        let frame = CGRectMake(0, 0, self.view.frame.size.width - 40, self.view.frame.size.height)
        for viewController in self.pageViewControllers {
            viewController.view.frame = frame
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view.isKindOfClass(UIScrollView) {
                view.frame = UIScreen.mainScreen().bounds
            } else if view.isKindOfClass(UIPageControl) {
                let pageControl = view as! UIPageControl
                pageControl.pageIndicatorTintColor = UIColor.grayColor()
                pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
                view.backgroundColor = UIColor.clearColor()
            }
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let index = pageViewControllers.indexOf(viewController)!
        
        if index - 1 >= 0 {
            return pageViewControllers[index - 1]
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index = pageViewControllers.indexOf(viewController)!
        
        if index + 1 < pageViewControllers.count {
            return pageViewControllers[index + 1]
        }
        
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
