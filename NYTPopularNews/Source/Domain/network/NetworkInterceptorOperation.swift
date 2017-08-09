//
//  NetworkInterceptor.swift
//  NYTPopularNews
//
//  Created by android on 8/7/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import Foundation
import Alamofire

class NetworkInterceptorOperation: ConcurrentNetworkOperation {
    
    var request: Alamofire.Request!
    let completionHandler: COMPLETION_HANDLER!
    var parser: PARSER_BLOCK!
    
    var manager: Alamofire.Manager!
    var method: Alamofire.Method!
    var url: String!
    var parameters: [String: AnyObject]!
    var encoding: Alamofire.ParameterEncoding!
    var headers: [NSObject : AnyObject]!
    
    
    init(method: Alamofire.Method, url: String, params: [String: AnyObject]? = nil,
         encoding: Alamofire.ParameterEncoding = .JSON,
         completionHandler: COMPLETION_HANDLER, parser: PARSER_BLOCK) {
        self.completionHandler = completionHandler
        self.url = url
        self.method = method
        self.parameters = params
        self.encoding = encoding
        self.headers = [:]
        self.parser = parser
        super.init()
    }
    
    
    // when the operation actually starts, this is the method that will be called
    
    override func main() {
        let configuration = getConfiguration()
        configuration.HTTPAdditionalHeaders = getDefaultHeaders()
        self.manager = Alamofire.Manager(configuration: configuration)
        self.request = self.manager.request(self.method, self.url, parameters: self.parameters, encoding: self.encoding).responseJSON {
            response in
            switch response.result {
            case .Success(let JSON):
                if let data = JSON as? NSDictionary {
                    debugPrint(data)
                    if let parser = self.parser {
                        if let (data, error) = parser(response: response.response, data: data, error: nil) {
                            self.completionHandler(data: data, error: error)
                            self.completeOperation()
                            return
                        }
                    }
                    //TODO: Parser Logic
                    self.completionHandler(data: data, error: nil)
                    self.completeOperation()
                }
            case .Failure(let error):
                //TODO: Generic Logic for Error Parsing
                if let err = self.errorParser(error) {
                    self.completionHandler(data: nil, error: err)
                    self.completeOperation()
                }
            }
        }
    }
    
    /**
     Used for handling the JSON Parser exception and connectivity issues
     
     - parameter error: NSError
     
     - returns: ErrorResponse
     */
    private func errorParser(error: NSError?) -> ErrorResponse? {
        let errorResponse = ErrorResponse()
        if let error = error where error.domain == NSURLErrorDomain && (error.code == NSURLErrorNotConnectedToInternet
            || error.code == NSURLErrorCannotFindHost || error.code == NSURLErrorCancelled ) {
            errorResponse.message = "Please check your internet connection"
        }
        return errorResponse
    }
    
    override func cancel() {
        request.cancel()
        super.cancel()
    }
    
}


extension NetworkInterceptorOperation {
    
    /**
     Setup the base configuration for timeout etc
     
     - returns: NSURLSessionConfiguration
     */
    private func getConfiguration() -> NSURLSessionConfiguration {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 180
        configuration.timeoutIntervalForResource = 180
        configuration.HTTPCookieAcceptPolicy = NSHTTPCookieAcceptPolicy.Always
        configuration.HTTPMaximumConnectionsPerHost = 10
        return configuration
    }
    
    /**
     Load any default headers required
     
     - returns: NSDictionary
     */
    private func getDefaultHeaders() -> [NSObject : AnyObject] {
        let defaultHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        return defaultHeaders
    }
}
