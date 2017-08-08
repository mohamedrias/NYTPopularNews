//
//  UIImage+Extension.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    
    /**
     Load image from URL
     
     - parameter url:         String - url of the image
     - parameter placeholder: Placeholder if required
     */
    public func loadImage(url: String, placeholder: String?=nil) {
        self.showActivityIndicator()
        if let placeholder = placeholder {
            self.image = UIImage(named: placeholder)
        }
        RestApiAdapter.requestImage(url) { (data, success) in
            self.hideActivityIndicator()
            if success {
                UIView.transitionWithView(self,
                                          duration: 1,
                                          options: UIViewAnimationOptions.TransitionCrossDissolve,
                                          animations: {
                                            dispatch_async(dispatch_get_main_queue(), {
                                                self.image = UIImage(data: data!)
                                            })
                    },
                                          completion: nil)
                return
            } else {
                if let placeholder = placeholder {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.image = UIImage(named: placeholder)
                    })
                }
            }
        }
    }
    
}