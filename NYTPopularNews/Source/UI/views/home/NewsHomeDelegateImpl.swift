//
//  NewsHomeDelegateImpl.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation


class NewsHomeDelegateImpl: NewsHomeDelegate {
    
    let view: NewsHomeView
    
    init(view: NewsHomeView) {
        self.view = view
    }
    
    func start() {
        self.fetchMostViewedArticles()
    }
    
    func stop() {
        
    }
    
    func fetchMostViewedArticles() {
        self.view.showLoading()
        NYTAPIService.getInstance().fetchPopularNews(onArticlesFetchSuccess, failureHandler: onArticlesFetchError)
    }
    
    func refreshArticles() {
        self.view.showLoading()
        NYTAPIService.getInstance().fetchPopularNews(onArticlesFetchSuccess, failureHandler: onArticlesRefreshError)
    }
    
    
    func onArticlesFetchSuccess(articles: [Article]?) -> () {
        self.view.hideLoading()
        self.view.showMostViewedArticles(articles ?? [])
    }
    
    
    func onArticlesFetchError(error: ErrorResponse?) -> () {
        self.view.hideLoading()
        if let err = error {
            if let message = err.message {
                self.view.showErrorPlaceholderView(message)
            }
        }
    }
    
    
    func onArticlesRefreshError(error: ErrorResponse?) -> () {
        self.view.hideLoading()
        if let err = error {
            if let message = err.message {
                self.view.showErrorPlaceholderView(message)
            }
        }
    }
    
}