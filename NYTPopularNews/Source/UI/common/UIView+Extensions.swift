//
//  UIView+Extensions.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /**
     Used to setup autolayout constraints.
     
     - parameter childView: UIView
     */
    func fillParent(childView: UIView) {
        let topConstraint = NSLayoutConstraint(item: childView,
                                               attribute: .TopMargin, relatedBy: .Equal,
                                               toItem: self, attribute: .TopMargin,
                                               multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: childView, attribute: .BottomMargin, relatedBy: .Equal,
                                                  toItem: self, attribute: .BottomMargin, multiplier: 1, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: childView, attribute: .Leading, relatedBy: .Equal,
                                                toItem: self, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: childView, attribute: .Trailing, relatedBy: .Equal,
                                                    toItem:
            self, attribute: .Trailing, multiplier: 1, constant: 0)
        addConstraints([topConstraint, bottomConstraint, leftConstraint, trailingConstraint])
    }
}
