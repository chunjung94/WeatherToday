//
//  Countries.swift
//  WeatherToday
//
//  Created by 김천중 on 2022/06/16.
//

import Foundation


struct Countries: Codable {
    
    let koreanName: String
    let assetName: String
    
    enum Codingkeys: String, CodingKey {
        
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
    
}
