//
//  ScreeningSlidesPageViewController.swift
//  BSD
//
//  Created by Victor Yurkin on 6/14/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import UIKit

class ScreeningSlidesPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    let pageViewControllers: [UIViewController] = {
        let slide1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ScreeningSlide1")
        let slide2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ScreeningSlide2")
        let slide3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ScreeningSlide3")
        let slide4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ScreeningSlide4")
        let slide5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ScreeningSlide5")
        return [slide1, slide2, slide3, slide4, slide5]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        setViewControllers([pageViewControllers[0]], direction: .Forward, animated: false, completion: nil)
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
