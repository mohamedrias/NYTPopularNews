//
//  BaseViewController.swift
//  NYTPopularNews
//
//  Created by android on 8/7/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import UIKit

/// Base View Controller for managing the routine tasks of the view controller
class BaseViewController: UIViewController, BaseView {
    
    // MARK: UI initialization & References setup
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.setup()
    }
    
    func setup() {
        // Adding listeners for keyboard
        // hiding keyboard
        // showing keyboard
        // keyboard accessory view
    }
    
    // MARK: Localization setup
    func localize() {
        
    }
    
    // Action for back arrow button navigation
    func backButtonPressed() {
        
    }
    
}


extension BaseViewController {
    
    func showLoading() {
        self.view.showActivityIndicator()
    }
    
    func hideLoading() {
        self.view.hideActivityIndicator()
    }
    
    
}