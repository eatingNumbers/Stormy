//: Playground - noun: a place where people can play

import Foundation

let forecastAPIKey = "54fd9453fdd74d53592297e64441614c"

let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")

let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)



