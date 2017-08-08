//
//  ErrorPlaceholderView.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import UIKit

class ErrorPlaceholderView: UIView {
    
    //MARK:- UI Components
    @IBOutlet weak var lblErrorMessage: UILabel!
    
    //MARK:- Instance Variables
    static let TAG: Int = 999
    
    //MARK:- View lifecycle components
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    //MARK:- Initializing view
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "ErrorPlaceholderView", bundle: bundle)
        let view: UIView! = nib.instantiateWithOwner(self, options: nil)[0] as? UIView
        view.frame = bounds
        self.addSubview(view)
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
    }
    
    func setup() {
        loadViewFromNib()
    }
    
    class func initialize(frame: CGRect, placeholder: String) -> UIView  {
        let placeHolderView = ErrorPlaceholderView(frame: frame)
        placeHolderView.lblErrorMessage.text = placeholder
        placeHolderView.lblErrorMessage.numberOfLines = 0
        placeHolderView.lblErrorMessage.textAlignment = .Center
        placeHolderView.tag = ErrorPlaceholderView.TAG
        return placeHolderView
    }
    
    class func removePlaceholderView(view: UIView) {
        view.viewWithTag(ErrorPlaceholderView.TAG)?.removeFromSuperview()
    }
}
