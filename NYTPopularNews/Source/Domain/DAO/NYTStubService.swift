//
//  NYTStubService.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import ObjectMapper

public class NYTStubService: NYTDomain {


    public static func fetchPopularNews(successHandler: NYTAPIService.SUCCESS_CALLBACK, failureHandler: NYTAPIService.FAILURE_CALLBACK) {
        successHandler(articles: getSuccessResponse())
    }


    private static func getSuccessResponse() -> [Article]? {
        return []
    }

    private static func getErrorResponse() -> ErrorResponse? {

        return nil
    }

}
