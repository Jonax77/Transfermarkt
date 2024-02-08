//
//  APIConfig.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/16/24.
//

import Foundation
import Alamofire

class APIConfig {
    static let TRANSFERMARKT_BASE_URL = "https://transfermarkt-api.vercel.app"
    static let SPORTSDB_BASE_URL = "https://thesportsdb.com/api/v1/json/3" // 3 is the sample api key
    static let FOOTBALL_API_BASE_URL = "https://v3.football.api-sports.io"
    static let FOOTBALL_API_KEY = "78681b51c4c69b40f07e3c65f09af8eb" // just for educational use
    static let FOOTBALL_API_HEADERS : HTTPHeaders = [
        "x-rapidapi-key": FOOTBALL_API_KEY,
        "x-rapidapi-host": "v3.football.api-sports.io"
    ]
}
