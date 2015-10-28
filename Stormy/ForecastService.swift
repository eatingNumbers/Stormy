//
//  ForecastService.swift
//  Stormy
//
//  Created by Dean Laurea on 10/28/15.
//  Copyright © 2015 Dean Laurea. All rights reserved.
//

import Foundation

struct ForecastService {
    
    let forecastAPIKey: String
    let forecastBaseURL: NSURL?
    
    init(APIKey: String){
        self.forecastAPIKey = APIKey
        forecastBaseURL = NSURL(string: "https://api.forecast.io/foreca/\(forecastAPIKey)/")
    }

    func getForecast(lat: Double, long: Double, completion: (CurrentWeather? -> Void)){
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL) {
            
            let networkOperation = NetworkOperation(url: forecastURL)
            networkOperation.downloadJSONFromURL {
                (let JSONDictionary) in
                let currentWeather = self.currentWeatherFromJSON(JSONDictionary)
                completion(currentWeather)
            }
            
        } else {
            
            print("Could not construct a valid URL")
        
        }
    }
    
    func currentWeatherFromJSON(jsonDictionary: [String: AnyObject]?) -> CurrentWeather? {
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject] {
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        } else {
            print("JSON dictionary returned nil for 'currently' key")
            return nil
        }
    }
}





