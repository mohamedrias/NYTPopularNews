//
//  NYTModel.swift
//  NYTPopularNews
//
//  Created by android on 8/7/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation

public class NYTAPIService {

    public typealias SUCCESS_CALLBACK = (articles: [Article]?) -> ()
    public typealias FAILURE_CALLBACK = (error: ErrorResponse?) -> ()

    public class func getInstance(type: String = "REST") -> NYTDomain.Type {
        switch type {
        case "STUB":
            return NYTStubService.self
        default:
            return NYTRestAPIService.self
        }
    }

}

public protocol NYTDomain {

    static func fetchPopularNews(successHandler: NYTAPIService.SUCCESS_CALLBACK, failureHandler: NYTAPIService.FAILURE_CALLBACK)

}
