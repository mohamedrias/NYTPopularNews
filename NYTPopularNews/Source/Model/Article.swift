//
//  Article.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import ObjectMapper

public class Article: Mappable {
    var url: String?
    var adx_keywords: String?
    var column: String?
    var section: String?
    var byline: String?
    var type: String?
    var title: String?
    var abstract: String?
    var published_date: String?
    var source: String?
    var id: String?
    var asset_id: String?
    var views: String?
    var des_facetList: [String]?
    var org_facet: String?
    var per_facetList: [String]?
    var geo_facet: String?
    var mediaList: [Media]?
    
    public init() {
        
    }
    
    
    public required init?(_ map: Map) {
        
    }
    
    // Mappable
    public func mapping(map: Map) {
        url                 <- map["url"]
        adx_keywords        <- map["adx_keywords"]
        column              <- map["column"]
        section             <- map["section"]
        byline              <- map["byline"]
        type                <- map["type"]
        title               <- map["title"]
        abstract            <- map["abstract"]
        published_date      <- map["published_date"]
        source              <- map["source"]
        id                  <- map["id"]
        asset_id            <- map["asset_id"]
        views               <- map["views"]
        des_facetList       <- map["des_facet"]
        org_facet           <- map["org_facet"]
        per_facetList       <- map["per_facet"]
        geo_facet           <- map["geo_facet"]
        mediaList           <- map["media"]
    }
    
    func getArticleImage(width: Double = 320, height: Double = 320) -> Media? {
        if let mediaList = self.mediaList {
            let matchingMedia = mediaList.filter({ (item: Media) -> Bool in
                let matchingMeta = item.mediaMetadataList?.filter({ (metaItem: MediaMetadata) -> Bool in
                    return metaItem.width == width && metaItem.height == height
                })
                return matchingMeta?.count > 0
            })
            return matchingMedia.first
        }
        return nil
    }
}