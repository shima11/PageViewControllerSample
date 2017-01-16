//
//  ViewController.swift
//  PageViewControllerSample
//
//  Created by shima jinsei on 2017/01/16.
//  Copyright © 2017年 Jinsei Shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.red
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let storyboard = UIStoryboard(storyboard: .PageViewController)
        let pageVC: PageViewController = storyboard.instantiateViewController()
        
        //        present(pageVC, animated: false, completion: nil)
        
        addChildViewController(pageVC)
        view.addSubview(pageVC.view)
        pageVC.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

