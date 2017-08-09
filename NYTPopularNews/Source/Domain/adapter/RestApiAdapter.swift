//
//  RestApiAdapter.swift
//  NYTPopularNews
//
//  Created by android on 8/7/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

public typealias PARSER_BLOCK = ((response: NSHTTPURLResponse?, data: NSDictionary?, error: NSError?) ->  (data: NSDictionary?, error: ErrorResponse?)?)
public typealias COMPLETION_HANDLER = ((data: NSDictionary?, error: ErrorResponse?) ->  ())

public struct RestApiAdapter {

    static var sharedInstance = RestApiAdapter()

    public static func request(method: Alamofire.Method = .GET, url: String, params: [String: AnyObject]? = nil,
                               encoding: Alamofire.ParameterEncoding = .JSON,
                               completionHandler: COMPLETION_HANDLER) {
        let queue = NSOperationQueue()
        let operation = NetworkInterceptorOperation(method: method, url: url, params: params,  encoding: encoding,
                                                    completionHandler: completionHandler,
                                                    parser: RestApiAdapter.NYTParser)
        queue.addOperation(operation)
    }


    public static func requestImage(url: String, completionHandler: (data: NSData?, success: Bool) -> ()) {
        if let url = NSURL(string: url) {
            let request = NSURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.ReturnCacheDataElseLoad, timeoutInterval: 24 * 60 * 60.0)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let _ = error {
                    completionHandler(data: nil, success: false)
                    return
                }
                if let data = data {
                    completionHandler(data: data, success: true)
                    return
                }
                completionHandler(data: data, success: false)
            }
        } else {
            completionHandler(data: nil, success: false)
        }
    }

}


extension RestApiAdapter {

    /**
     Based on the API endpoint, define the response parser

     - parameter response: NSHTTPURLResponse
     - parameter data:     NSDictionary
     - parameter error:    NSError

     - returns: (NSDictionary, ErrorResponse)
     */
    static func NYTParser(response: NSHTTPURLResponse?, data: NSDictionary?, error: NSError?)-> (data: NSDictionary?, error: ErrorResponse?)? {
        if let response = data {
            if let result = Mapper<GenericResponse>().map(response) {
                guard let status = result.status where status == "OK" else {
                    let errorResponse: ErrorResponse = ErrorResponse()
                    errorResponse.message = result.message
                    return (data, errorResponse)
                }
                return (data, nil)
            }
        }
        let errorResponse: ErrorResponse = ErrorResponse()
        errorResponse.message = "Sorry, we're having difficulties in processing your request. Please try again later"
        return (data, errorResponse)
    }

}
