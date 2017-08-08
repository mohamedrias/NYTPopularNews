//
//  BaseView.swift
//  NYTPopularNews
//
//  Created by android on 8/7/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation

/**
 *  Defines the possible states of the base view
 */
protocol BaseView {
    
    //MARK: UI States
    /**
     Used to show the loading icon whenever some async task is happening and hte UI is waiting for it to complete
     */
    func showLoading()
    
    /**
     Hides the loading icon once the async task is completed
     */
    func hideLoading()
    
    /**
     Used to localize the view based on language selection
     */
    func localize()
    
}

// MARK: - Default implementations of methods.
extension BaseView {
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func localize() {
        
    }
}
