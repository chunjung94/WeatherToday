//
//  Weather.swift
//  WeatherToday
//
//  Created by 김천중 on 2022/06/16.
//

import Foundation

struct Weather: Codable {
    
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    enum Codingkeys: String, CodingKey {
        
        case cityName = "city_name"
        case state, celsius
        case rainfallProbability = "rainfall_probability"
        
    }

}
