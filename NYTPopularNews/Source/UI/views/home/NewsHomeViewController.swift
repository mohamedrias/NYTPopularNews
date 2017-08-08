//
//  NewsHomeViewControllerTableViewController.swift
//  NYTPopularNews
//
//  Created by android on 8/7/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import UIKit

class NewsHomeViewController: BaseViewController, NewsHomeView, ArticleTableViewDelegate {
    
    //MARK:- UI Components
    @IBOutlet weak var articlesTableView: ArticlesTableView!
    
    //MARK:- Instance variables
    private var delegate: NewsHomeDelegate!
    
    
    //MARK:- Base view controller setup
    override func setup() {
        self.articlesTableView.delegate = self
        delegate = NewsHomeDelegateImpl(view: self)
        delegate.start()
    }
    
    class func getInstance() -> NewsHomeViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController: NewsHomeViewController! = storyboard.instantiateViewControllerWithIdentifier("NewsHomeViewController") as? NewsHomeViewController
        return viewController
    }
    
    
    //MARK:- Action Handlers
    @IBAction func refreshAction(sender: AnyObject) {
        ErrorPlaceholderView.removePlaceholderView(self.view)
        self.delegate.refreshArticles()
    }
    
    
    //MARK:- Possible UI States
    func showMostViewedArticles(articles: [Article]) {
        ErrorPlaceholderView.removePlaceholderView(self.view)
        self.articlesTableView?.reloadArticles(articles)
    }
    
    func showErrorPlaceholderView(message: String) {
        ErrorPlaceholderView.removePlaceholderView(self.view)
        self.view.addSubview(ErrorPlaceholderView.initialize(CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), placeholder: message))
    }
    
    //MARK:- ArticleTableViewDelegate methods for listening to clicke vent
    func selectedArticle(index: Int, article: Article) {
        let viewController = NewsDetailViewController.getInstance(article)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
