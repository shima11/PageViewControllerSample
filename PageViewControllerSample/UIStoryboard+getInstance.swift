//
//  UIStoryboard+getInstance.swift
//  PageViewControllerSample
//
//  Created by shima jinsei on 2017/01/16.
//  Copyright © 2017年 Jinsei Shima. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: StoryboardIdentifiable { }

extension UIStoryboard {
    
    enum Storyboard: String {
        case Root
        case Main
        case ShotDetail
        case Profile
        case UserList
        case LikeShotList
        case Settings
        case MyPage
        case PageViewController
    }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        let optionalViewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier)
        guard let viewController = optionalViewController as? T else { fatalError("view instantial error")}
        return viewController
    }
}
