//
//  MostViewedArticlesResponseWrapper.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import ObjectMapper

public class MostViewedArticlesResponseWrapper: Mappable {
    var status: String?
    var copyright: String?
    var numberOfResults: String?
    var articles: [Article]?
    var message: String?
    
    public init() {
        
    }
    
    
    public required init?(_ map: Map) {
        
    }
    
    // Mappable
    public func mapping(map: Map) {
        status              <- map["status"]
        copyright           <- map["copyright"]
        numberOfResults     <- map["num_results"]
        articles            <- map["results"]
        message             <- map["message"]
    }
}