//
//  ImageViewController.swift
//  PageViewControllerSample
//
//  Created by shima jinsei on 2017/01/16.
//  Copyright © 2017年 Jinsei Shima. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, Pageable {

    var pageIndex: Int = 0
    var data: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue

    }

    func setData(pageIndex: Int, data: String) {
        self.pageIndex = pageIndex
        self.data = data
        
        let label = UILabel()
        label.frame = CGRect(x:0,y:0,width:200,height:40)
        label.text  = "image page\(pageIndex)-" + data
        label.center = view.center
        view.addSubview(label)
    }

}
