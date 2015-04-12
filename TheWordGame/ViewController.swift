//
//  ViewController.swift
//  UIPageViewController
//
//  Created by Cowboy Lynk on 4/10/15.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    var pageImages: NSArray!
    var pageText: NSArray!
    var pageBackground: NSArray!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        self.pageImages = NSArray(objects: "add", "sub", "switch", "s", "order", "fjord")
        
        
        self.pageText = NSArray(objects: "You may add one letter to the current word to create a new word.", "You may subtract one letter from the current word to create a new word.", "You may exchange one letter in the current word to create a new word.", "Plurals are not allowed.", "You may not change the order of any letters in the word.", "Under NO circumstances can you play the word fjord. Why? Because we said so.")
        
        
        self.pageBackground = NSArray(objects: "bgGreen", "bgGreen", "bgGreen", "bgRed", "bgRed", "bgRed")

        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as UIPageViewController
        self.pageViewController.dataSource = self

        var startVC = self.viewControllerAtIndex(0) as ContentViewController
        var viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.size.height - 60)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func restartAction(sender: AnyObject)
    {
        var startVC = self.viewControllerAtIndex(0) as ContentViewController
        var viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
    }
    
    func viewControllerAtIndex(index: Int) -> ContentViewController
    {
        if ((self.pageText.count == 0) || (index >= self.pageText.count)) {
            return ContentViewController()
        }
        
        var vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as ContentViewController
        
        vc.imageFile = self.pageImages[index] as String
        vc.backgroundFile = self.pageBackground[index] as String
        vc.textText = self.pageText[index] as String
        vc.pageIndex = index
        
        return vc
        
        
    }
    
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        
        var vc = viewController as ContentViewController
        var index = vc.pageIndex as Int
        
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
            
        }
        
        index--
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var vc = viewController as ContentViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index++
        
        if (index == self.pageText.count)
        {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
  
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.pageText.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }

}

