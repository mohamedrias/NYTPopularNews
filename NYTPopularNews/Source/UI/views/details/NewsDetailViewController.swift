//
//  NewsDetailViewController.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import UIKit


class NewsDetailViewController: BaseViewController {
    
    //MARK:- UI Components
    @IBOutlet weak var imgLargeArticle: UIImageView!
    @IBOutlet weak var lblArticleAbstract: UILabel!
    @IBOutlet weak var lblArticleTitle: UILabel!
    
    //MARK:- Instance variables
    final var selectedArticle: Article!
    
    //MARK:- Base view controller setup
    override func setup() {
        self.title = self.selectedArticle.type
        self.lblArticleTitle.text = self.selectedArticle.title
        if let largeImage = self.selectedArticle.getArticleImage(440, height: 293)?.getArticleImage(440, height: 293) where largeImage.url != "" {
            self.imgLargeArticle?.loadImage(largeImage.url!)
        }
        self.lblArticleAbstract?.text = self.selectedArticle.abstract
    }
    
    
    class func getInstance(article: Article) -> NewsDetailViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController: NewsDetailViewController! = storyboard.instantiateViewControllerWithIdentifier("NewsDetailViewController") as? NewsDetailViewController
        viewController.selectedArticle = article
        return viewController
    }
    
}