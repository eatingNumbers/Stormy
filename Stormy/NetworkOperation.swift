//
//  NetworkOperation.swift
//  Stormy
//
//  Created by Dean Laurea on 10/23/15.
//  Copyright © 2015 Dean Laurea. All rights reserved.
//

import Foundation

class NetworkOperation {
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    
    typealias JSONDictionaryCompletion = ([String:AnyObject]?) -> Void
    
    init(url:NSURL) {
    
        self.queryURL = url
    
    }
    
    func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
        let request: NSURLRequest = NSURLRequest(URL: queryURL)
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            
            if let httpResponse = response as? NSHTTPURLResponse{
                
                switch(httpResponse.statusCode){
                case 200:
                    
                    print("Good to go!")
                    
                    do {
                    
                    print("getting positive response 2+++")
                    
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [String: AnyObject]
                    completion(jsonDictionary)
                    
                    print("getting positive response 4 ")
                    
                    } catch let error {
                    
                        print("JSON Serialization failed. Error: \(error)")
                   
                    }
                    
                    
                    let jsonDictionary = try!NSJSONSerialization.JSONObjectWithData(data!, options:[]) as? [String: AnyObject]
                    print("getting positive response 4 ")
                    completion(jsonDictionary)
                    
                default:
                    print("GET request not successful. HTTP status code: \(httpResponse.statusCode)")
                }
                
            } else {
               
                print("Error: Not a valid HTTP response")
            
            }
        }
        
        dataTask.resume()
    }
}


