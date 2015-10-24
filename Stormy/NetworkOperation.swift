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
    
    init(url:NSURL) {
    
        self.queryURL = url
    
    }
}

