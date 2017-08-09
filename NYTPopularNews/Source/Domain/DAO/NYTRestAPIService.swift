//
//  NYTRestAPIService.swift
//  NYTPopularNews
//
//  Created by android on 8/8/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import ObjectMapper

public class NYTRestAPIService: NYTDomain {

    private static let APITOKEN: String = "865a9fb03c424e9c92c7098718ca07c5"
    private static let BASEURL: String = "https://api.nytimes.com/svc/mostpopular/v2"

    public static func fetchPopularNews(successHandler: NYTAPIService.SUCCESS_CALLBACK, failureHandler: NYTAPIService.FAILURE_CALLBACK) {
        RestApiAdapter.request(url: getUrl()) { (data: NSDictionary?, error: ErrorResponse?) in
            if let err = error where err.message != "" {
                failureHandler(error: error)
                return
            }
            if let response = data {
                let result = Mapper<MostViewedArticlesResponseWrapper>().map(response)
                if let articles = result?.articles {
                    successHandler(articles: articles)
                } else {
                    successHandler(articles: [])
                }
            }
        }
    }


    private static func getUrl(section: String = "all-sections", duration: String = "7") -> String {
        return BASEURL + "/mostviewed/"+section+"/"+duration+".json?api-key="+APITOKEN
    }

}
