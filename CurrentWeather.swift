//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Dean Laurea on 10/22/15.
//  Copyright © 2015 Dean Laurea. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
    let temperature: Int
    let humidty: Int
    let precipProbability: Int
    let summary: String
    
    init(weatherDictionary: [String: AnyObject]){
        temperature = weatherDictionary["temperature"] as! Int
        humidty = weatherDictionary["humidy"] as! Int
        precipProbability = weatherDictionary["precipChance"] as! Int
        summary = weatherDictionary["summary"] as! String
        
    }
}