//
//  NewsHomeView.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation

/**
 *  Possible view states
 */
protocol NewsHomeView: BaseView {

    /**
     Show most viewed articles in the tableview

     - parameter articles: [Article]
     */
    func showMostViewedArticles(articles: [Article])

    /**
     Show error placeholder view in case of service or connectivity error

     - parameter message: String
     */
    func showErrorPlaceholderView(message: String)
}


/**
 *  Actions
 */
protocol NewsHomeDelegate: BaseDelegate {

    /**
     Fetch the most viewed articles from the DAO
     */
    func fetchMostViewedArticles()

    /**
     Refresh articles on click of button action
     */
    func refreshArticles()

}
