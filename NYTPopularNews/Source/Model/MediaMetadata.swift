//
//  MediaMetadata.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import ObjectMapper

public class MediaMetadata: Mappable {
    
    var url: String?
    var format: String?
    var height: Double?
    var width: Double?
    
    public init() {
        
    }
    
    public required init?(_ map: Map) {
        
    }
    
    // Mappable
    public func mapping(map: Map) {
        url         <- map["url"]
        format      <- map["format"]
        height      <- map["height"]
        width       <- map["width"]
    }
    
}