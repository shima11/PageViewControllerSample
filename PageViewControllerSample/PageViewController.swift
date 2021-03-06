//
//  PageViewController.swift
//  PageViewControllerSample
//
//  Created by shima jinsei on 2017/01/16.
//  Copyright © 2017年 Jinsei Shima. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var viewcontrollers:[UIViewController] = [UIViewController]()
    
    let datas:[String] = ["hoge1","hoge2","hoge3"]
    var currentPageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.green
        delegate = self
        dataSource = self

        var index: Int = 0
        for data in datas {
            let viewcontroller = ImageViewController()
            viewcontroller.view.frame = view.frame
            viewcontroller.setData(pageIndex: index, data: data)
            viewcontrollers.append(viewcontroller)
            index += 1
        }
        for data in datas {
            let viewcontroller = VideoViewController()
            viewcontroller.view.frame = view.frame
            viewcontroller.setData(pageIndex: index, data: data)
            viewcontrollers.append(viewcontroller)
            index += 1
        }
        setViewControllers([viewcontrollers.first!], direction: .forward, animated: false, completion: nil)
    }

}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        currentPageIndex = (viewController as! Pageable).pageIndex
        if currentPageIndex-1 < 0 {
            return nil
        }
        currentPageIndex -= 1
        return viewcontrollers[currentPageIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        currentPageIndex = (viewController as! Pageable).pageIndex
        if currentPageIndex+1 >= viewcontrollers.count {
            return nil
        }
        currentPageIndex += 1
        return viewcontrollers[currentPageIndex]
    }
    
//    func viewControllerAtIndex(index: Int) -> UIViewController {
//        let viewcontroller = viewcontrollers[index]
//        currentPageIndex = index
//        
//        return viewcontroller
//    }
}

extension PageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        currentPageIndex = (previousViewControllers.first as! Pageable).pageIndex
        print("current index:\(currentPageIndex)")
    }
}



