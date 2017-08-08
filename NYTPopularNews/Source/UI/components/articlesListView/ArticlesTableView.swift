//
//  ArticlesTableView.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import UIKit


class ArticlesTableView: UIView, UITableViewDelegate {
    
    //MARK:- UI Components
    var tableView: UITableView! = UITableView()
    
    //MARK:- Instance Variables
    var dataSource: ArticlesDataSource!
    var selectedArticle: Article!
    var delegate: ArticleTableViewDelegate!
    
    var articles: [Article]! = [] {
        didSet {
            if articles.count == 0 {
                self.tableView?.hidden = true
                return
            }
            self.tableView?.hidden = false
            self.dataSource?.reloadData(self.articles)
        }
    }
    
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
    func setup() {
        self.dataSource = ArticlesDataSource(tableView: self.tableView, articles: self.articles)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
        self.tableView.registerNib(UINib(nibName: ArticleTableViewCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.IDENTIFIER)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.tableView)
        self.fillParent(self.tableView)
        self.tableView.hidden = true
    }
    
    /**
     Reload articles
     
     - parameter articles: [Article]
     */
    func reloadArticles(articles: [Article]) {
        self.tableView.hidden = false
        self.articles = articles
    }
    
}

// MARK: - Tableview delegate methods
extension ArticlesTableView {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedArticle = self.articles[indexPath.row]
        self.delegate?.selectedArticle(indexPath.row, article: self.selectedArticle)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180.0
    }
    
}

/**
 *  Any container which wants to listen to the didSelectRowAtIndexPath event, need to conform this protocol
 */
protocol ArticleTableViewDelegate {
    func selectedArticle(index: Int, article: Article)
}


