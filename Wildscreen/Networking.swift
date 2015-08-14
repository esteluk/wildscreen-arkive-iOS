//
//  Networking.swift
//  Wildscreen
//
//  Created by Nathan Wong on 14/08/2015.
//  Copyright (c) 2015 Rockpool Digital. All rights reserved.
//

import Alamofire
import Foundation

class Networking {
    
    func animals(completion: (data: [NSDictionary]!) -> Void) -> Void {
        Alamofire.request(Router.Animals(10))
            .responseJSON(options: NSJSONReadingOptions.AllowFragments) { (request: NSURLRequest, response: NSHTTPURLResponse?, JSON, error: NSError?) -> Void in
                // We have the data!
                println(JSON)
                
                if let animals = JSON as? [NSDictionary] {
                    completion(data: animals)
                }
        }
    }
    
    enum Router: URLRequestConvertible {
        static let baseURLString = "http://wildscreenanimalsapi.azurewebsites.net/api/"
        
        case Animals(Int)
        
        var method: Alamofire.Method {
            switch self {
            case .Animals:
                return .GET
            }
        }
        
        var path: String {
            switch self {
            case .Animals(let limit):
                return "/animals/getrandom/\(limit)"
            }
        }
        
        var URLRequest: NSURLRequest {
            let url = NSURL(string: Router.baseURLString)!
            let mutableURLRequest = NSMutableURLRequest(URL: url.URLByAppendingPathComponent(path))
            mutableURLRequest.HTTPMethod = method.rawValue
            
            return mutableURLRequest
        }
    }
}