//
//  ArticleTableViewCell.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {


    //MARK:- UI Components
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!

    //MARK:- Instance Variables
    static let IDENTIFIER = "ArticleTableViewCell"

    //MARK:- Lifecyle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
