//
//  LoadingIconView.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import UIKit

class LoadingSpinnerView: UIView {
    
    var loadingParentView: UIView!
    var loadingIcon: UIActivityIndicatorView!
    
    init(parentView: UIView) {
        super.init(frame: CGRect(x: 0, y: 0, width: parentView.bounds.width, height: parentView.bounds.height))
        self.loadingParentView = parentView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func showLoadingIcon() {
        self.alpha = 0.6
        self.backgroundColor = UIColor.whiteColor()
        loadingIcon = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        loadingIcon.center = CGPointMake(loadingParentView.frame.width / 2,
                                         loadingParentView.frame.height / 2)
        loadingIcon.color = UIColor.redColor()
        loadingIcon.tag = 6787
        self.addSubview(loadingIcon)
        self.layer.zPosition = 999
        self.loadingParentView.userInteractionEnabled = false
        loadingParentView.addSubview(self)
        loadingParentView.bringSubviewToFront(self)
        loadingIcon?.startAnimating()
    }
    
    private func hideLoadingIcon() -> Void {
        UIView.animateWithDuration(0.3, delay: 0.3, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.alpha = 0
            }, completion: {
                finished in
                self.loadingIcon?.stopAnimating()
                self.loadingParentView.userInteractionEnabled = true
                self.removeFromSuperview()
        })
    }
    
    
    override func layoutSubviews() {
        if loadingIcon != nil {
            loadingIcon.center = CGPoint(x: loadingParentView.frame.width / 2,
                                         y: loadingParentView.frame.height / 2)
        }
    }
    
}

extension UIView {
    
    private struct LoadingIconsManager {
        static var loadingIcon:LoadingSpinnerView?
    }
    
    var spinnerView: LoadingSpinnerView? {
        get {
            if let spinner = objc_getAssociatedObject(self, &LoadingIconsManager.loadingIcon) as? LoadingSpinnerView {
                return spinner
            }
            let spinner = LoadingSpinnerView(parentView: self)
            objc_setAssociatedObject(self, &LoadingIconsManager.loadingIcon, spinner as LoadingSpinnerView?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return spinner
        }
    }
    
    func showActivityIndicator() {
        self.spinnerView?.showLoadingIcon()
    }
    
    func hideActivityIndicator() {
        self.spinnerView?.hideLoadingIcon()
    }
    
}