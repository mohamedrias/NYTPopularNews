//
//  GenericResponse.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import ObjectMapper

public class GenericResponse: Mappable {
    var status: String?
    var message: String?
    
    public init() {
        
    }
    
    
    public required init?(_ map: Map) {
        
    }
    
    // Mappable
    public func mapping(map: Map) {
        status            <- map["status"]
        message           <- map["message"]
    }
}
