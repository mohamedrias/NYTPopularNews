//
//  ArticleMedia.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import ObjectMapper

public class Media: Mappable {
    var type: String?
    var subtype: String?
    var caption: String?
    var copyright: String?
    var approved_for_syndication: String?
    var mediaMetadataList: [MediaMetadata]?

    public init() {

    }


    public required init?(_ map: Map) {

    }

    // Mappable
    public func mapping(map: Map) {
        type                        <- map["type"]
        subtype                     <- map["subtype"]
        caption                     <- map["caption"]
        copyright                   <- map["copyright"]
        approved_for_syndication    <- map["approved_for_syndication"]
        mediaMetadataList           <- map["media-metadata"]
    }

    public func getArticleImage(width: Double = 320, height: Double = 320) -> MediaMetadata? {
        if let mediaMetadataList = mediaMetadataList {
            let matchingMeta = mediaMetadataList.filter({ (metaItem: MediaMetadata) -> Bool in
                return metaItem.width == width && metaItem.height == height
            })
            if matchingMeta.count > 0 {
                return matchingMeta.first
            }
        }
        return nil
    }

}
