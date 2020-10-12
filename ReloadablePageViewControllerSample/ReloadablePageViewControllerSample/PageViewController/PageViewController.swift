//
//  PageViewController.swift
//  ReloadablePageViewControllerSample
//
//  Created by ichikawa on 2020/10/12.
//  Copyright © 2020 ichikawa. All rights reserved.
//

import UIKit

final class PageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
    
    var scrollView: UIScrollView? {
        if let v = self.view as? UIScrollView {
            return v
        }
        for v in view.subviews where v is UIScrollView {
            return v as? UIScrollView
        }
        return nil
    }
    
    func getFirst() -> ChildCollectionViewController {
        return storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! ChildCollectionViewController
    }
    
    func getSecond() -> ChildTableViewController {
        return storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! ChildTableViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ChildTableViewController.self) {
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ChildCollectionViewController.self) {
            // 1 -> 2
            return getSecond()
        } else {
            // 2 -> end of the road
            return nil
        }
    }
}
