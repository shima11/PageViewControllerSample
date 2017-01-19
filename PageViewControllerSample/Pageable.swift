//
//  Pageable.swift
//  PageViewControllerSample
//
//  Created by shima jinsei on 2017/01/17.
//  Copyright © 2017年 Jinsei Shima. All rights reserved.
//

import Foundation

protocol Pageable {
    var pageIndex: Int { set get }
    var data: String { set get }
}
