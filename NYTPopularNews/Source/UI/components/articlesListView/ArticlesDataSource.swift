//
//  ArticlesDataSource.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import UIKit

/// Datasource for displaying list of Articles
class ArticlesDataSource: NSObject, UITableViewDataSource {
    
    private let tableView: UITableView!
    private var articles: [Article]! = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    init(tableView: UITableView, articles: [Article] = []) {
        self.tableView = tableView
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.articles = articles
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if self.articles.count == 0 {
            let errorPlaceholderView = ErrorPlaceholderView.initialize(self.tableView.frame, placeholder: "No articles are present.")
            self.tableView.tableFooterView = errorPlaceholderView
            return 0
        }
        self.tableView.tableFooterView = UIView()
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.articles.count == 0 {
            return 1
        }
        return self.articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let articleListItem: ArticleTableViewCell! = tableView.dequeueReusableCellWithIdentifier(
            ArticleTableViewCell.IDENTIFIER) as? ArticleTableViewCell
        articleListItem.imgView.image = UIImage(named: "placeholder")
        let article = self.articles[indexPath.row]
        articleListItem?.lblTitle?.text = article.title
        if let articleImage =  article.getArticleImage() {
            if let image = articleImage.getArticleImage(), imageUrl = image.url where imageUrl != "" {
                articleListItem.imgView.loadImage(imageUrl)
            }
        }
        return articleListItem
    }
    
    /**
     Reload the tableview based on data
     
     - parameter articles: Article
     */
    func reloadData(articles: [Article]?) {
        if let articles = articles {
            self.articles = articles
            self.tableView.reloadData()
        }
    }
    
}
