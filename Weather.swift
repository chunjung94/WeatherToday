//
//  Weather.swift
//  WeatherToday
//
//  Created by 김천중 on 2022/06/16.
//

import Foundation

struct Weather: Codable {
    
//    let cityName: String
//    let state: Int
//    let celsius: Double
//    let rainfallProbability: Int
//
//    enum Codingkeys: String, CodingKey {
//
//        case cityName = "city_name"
//        case state, celsius
//        case rainfallProbability = "rainfall_probability"
//
//    }
    
    
    let city_name: String
    let state: Int
    let celsius: Double
    let rainfall_probability: Int
    
    var fahrenheit: Double {
        return round((celsius*9/5 + 32)*10)/10
    }
    
    var celsiusAndFahrenheit: String {
        return "섭씨: \(celsius),화씨: \(fahrenheit)"
    }
    
    var rainfallExplain: String {
        return "강수확률: \(rainfall_probability)%"
    }


}
