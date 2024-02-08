//
//  APIManager.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/16/24.
//

import Foundation
import Combine
import Alamofire

class APIManager {
    
    // /competitions/search/{competition_name}
    func searchLeague(leagueName: String, pageNumber: Int, completion: @escaping (String?, LeagueSearchResult?)  -> Void ) {
        
        let url = APIConfig.TRANSFERMARKT_BASE_URL + "/competitions/search/" + leagueName + "?page_number=" + String(pageNumber)
        
        AF.request(url,
                   method: .get
        ).response { response in
            let status = response.response?.statusCode
            
            switch response.result {
                    case .success(let data):
                
                if let uwStatusCode = status{
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            // Decode the JSON data into LeagueSearchResult
                            let decoder = JSONDecoder()
                            let leagueSearchResult = try decoder.decode(LeagueSearchResult.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, leagueSearchResult)
                        } catch {
                            // Decoding error
                            completion("Failed to decode data", nil)
                        }
                        break
                    default:
                        completion("Failed to fetch data", nil)
                        break
                    }
                }

                    case .failure(let error):
                        // Network request failure
                        completion("Failed to fetch data: \(error.localizedDescription)", nil)
                    }
        }
        
    }
    
    // /competitions/{competition_id}/clubs
    func getClubsInLeague(competitionID: String, seasonID: String?, completion: @escaping (String?, ClubInLeagueList?) -> Void) {
        
        var url = APIConfig.TRANSFERMARKT_BASE_URL + "/competitions/" + competitionID + "/clubs"
        
        if seasonID != nil {
            url += "?season_id=" + seasonID!
        }
        
        AF.request(url,
                   method: .get
        ).response { response in
            let status = response.response?.statusCode
            
            switch response.result {
                    case .success(let data):
                
                if let uwStatusCode = status{
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            // Decode the JSON data into LeagueSearchResult
                            let decoder = JSONDecoder()
                            let clubInLeagueList = try decoder.decode(ClubInLeagueList.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, clubInLeagueList)
                        } catch {
                            // Decoding error
                            completion("Failed to decode data", nil)
                        }
                        break
                    default:
                        completion("Failed to fetch data", nil)
                        break
                    }
                }

                    case .failure(let error):
                        // Network request failure
                        completion("Failed to fetch data: \(error.localizedDescription)", nil)
                    }
        }
    }
    
    // /clubs/search/{club_name}
    func searchClub(clubName: String, pageNumber: Int, completion: @escaping (String?, ClubSearchResult?)  -> Void ) {
        
        let url = APIConfig.TRANSFERMARKT_BASE_URL + "/clubs/search/" + clubName + "?page_number=" + String(pageNumber)
        
        AF.request(url,
                   method: .get
        ).response { response in
            let status = response.response?.statusCode
            
            switch response.result {
                    case .success(let data):
                
                if let uwStatusCode = status{
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            // Decode the JSON data into LeagueSearchResult
                            let decoder = JSONDecoder()
                            let clubSearchResult = try decoder.decode(ClubSearchResult.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, clubSearchResult)
                        } catch {
                            // Decoding error
                            completion("Failed to decode data", nil)
                        }
                        break
                    default:
                        completion("Failed to fetch data", nil)
                        break
                    }
                }

                    case .failure(let error):
                        // Network request failure
                        completion("Failed to fetch data: \(error.localizedDescription)", nil)
                    }
        }
    }
    
    // /clubs/{club_id}/profile
    func getClubProfile(clubID: String, completion: @escaping (String?, ClubProfile?) -> Void) {
        let url = APIConfig.TRANSFERMARKT_BASE_URL + "/clubs/" + clubID + "/profile"
        
        AF.request(url,
                   method: .get
        ).response { response in
            let status = response.response?.statusCode
            
            switch response.result {
                    case .success(let data):
                
                if let uwStatusCode = status{
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            // Decode the JSON data into LeagueSearchResult
                            let decoder = JSONDecoder()
                            let clubProfile = try decoder.decode(ClubProfile.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, clubProfile)
                        } catch {
                            // Decoding error
                            completion("Failed to decode data", nil)
                        }
                        break
                    default:
                        completion("Failed to fetch data", nil)
                        break
                    }
                }

                    case .failure(let error):
                        // Network request failure
                        completion("Failed to fetch data: \(error.localizedDescription)", nil)
                    }
        }
    }
    
    // /clubs/{club_id}/players
    func getClubSquad(clubID: String, completion: @escaping (String?, PlayerInSquadList?) -> Void) {
        
        let url = APIConfig.TRANSFERMARKT_BASE_URL + "/clubs/" + clubID + "/players"
        
        AF.request(url,
                   method: .get
        ).response { response in
            let status = response.response?.statusCode
            
            switch response.result {
                    case .success(let data):
                
                if let uwStatusCode = status{
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            // Decode the JSON data into LeagueSearchResult
                            let decoder = JSONDecoder()
                            let playerInSquad = try decoder.decode(PlayerInSquadList.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, playerInSquad)
                        } catch {
                            // Decoding error
                            completion("Failed to decode data", nil)
                        }
                        break
                    default:
                        completion("Failed to fetch data", nil)
                        break
                    }
                }

                    case .failure(let error):
                        // Network request failure
                        completion("Failed to fetch data: \(error.localizedDescription)", nil)
                    }
        }
    }
    
    // /players/search/{player_name}
    func searchPlayer(playerName: String, pageNumber: Int, completion: @escaping (String?, PlayerSearchResult?) -> Void) {
        
        let url = APIConfig.TRANSFERMARKT_BASE_URL + "/players/search/" + playerName + "?page_number=" + String(pageNumber)
        
        AF.request(url,
                   method: .get
        ).response { response in
            let status = response.response?.statusCode
            
            switch response.result {
                    case .success(let data):
                
                if let uwStatusCode = status{
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            // Decode the JSON data into LeagueSearchResult
                            let decoder = JSONDecoder()
                            let playerSearchResult = try decoder.decode(PlayerSearchResult.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, playerSearchResult)
                        } catch {
                            // Decoding error
                            completion("Failed to decode data", nil)
                        }
                        break
                    default:
                        completion("Failed to fetch data", nil)
                        break
                    }
                }

                    case .failure(let error):
                        // Network request failure
                        completion("Failed to fetch data: \(error.localizedDescription)", nil)
                    }
        }
    }
    
    // /players/{player_id}/profile
    func getPlayerProfile(playerID: String, completion: @escaping (String?, PlayerProfile?) -> Void) {
        
        let url = APIConfig.TRANSFERMARKT_BASE_URL + "/players/" + playerID + "/profile"
        
        AF.request(url,
                   method: .get
        ).response { response in
            let status = response.response?.statusCode
            
            switch response.result {
                    case .success(let data):
                
                if let uwStatusCode = status{
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            // Decode the JSON data into LeagueSearchResult
                            let decoder = JSONDecoder()
                            let playerProfile = try decoder.decode(PlayerProfile.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, playerProfile)
                        } catch {
                            // Decoding error
                            completion("Failed to decode data", nil)
                        }
                        break
                    default:
                        completion("Failed to fetch data", nil)
                        break
                    }
                }

                    case .failure(let error):
                        // Network request failure
                        completion("Failed to fetch data: \(error.localizedDescription)", nil)
                    }
        }
    }
    
    // /players/{player_id}/market_value
    func getPlayerMarketValue(playerID: String, completion: @escaping (String?, MarketValueHistory?) -> Void) {
        
        let url = APIConfig.TRANSFERMARKT_BASE_URL + "/players/" + playerID + "/market_value"
        
        AF.request(url,
                   method: .get
        ).response { response in
            let status = response.response?.statusCode
            
            switch response.result {
                    case .success(let data):
                
                if let uwStatusCode = status{
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            // Decode the JSON data into LeagueSearchResult
                            let decoder = JSONDecoder()
                            let marketValueHistory = try decoder.decode(MarketValueHistory.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, marketValueHistory)
                        } catch {
                            // Decoding error
                            completion("Failed to decode data", nil)
                        }
                        break
                    default:
                        completion("Failed to fetch data", nil)
                        break
                    }
                }

                    case .failure(let error):
                        // Network request failure
                        completion("Failed to fetch data: \(error.localizedDescription)", nil)
                    }
        }
    }
    
    // /players/{player_id}/transfers
    func getPlayerTransferHistory(playerID: String, completion: @escaping (String?, TransferHistory?) -> Void) {
        
        let url = APIConfig.TRANSFERMARKT_BASE_URL + "/players/" + playerID + "/transfers"
        
        AF.request(url,
                   method: .get
        ).response { response in
            let status = response.response?.statusCode
            
            switch response.result {
                    case .success(let data):
                
                if let uwStatusCode = status{
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            // Decode the JSON data into LeagueSearchResult
                            let decoder = JSONDecoder()
                            let transferHistory = try decoder.decode(TransferHistory.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, transferHistory)
                        } catch {
                            // Decoding error
                            completion("Failed to decode data", nil)
                        }
                        break
                    default:
                        completion("Failed to fetch data", nil)
                        break
                    }
                }

                    case .failure(let error):
                        // Network request failure
                        completion("Failed to fetch data: \(error.localizedDescription)", nil)
                    }
        }
    }
    
    // /players/{player_id}/stats
    func getPlayerStats(playerID: String, completion: @escaping (String?, StatHistory?) -> Void) {
        
        let url = APIConfig.TRANSFERMARKT_BASE_URL + "/players/" + playerID + "/stats"
        
        AF.request(url,
                   method: .get
        ).response { response in
            let status = response.response?.statusCode
            
            switch response.result {
                    case .success(let data):
                
                if let uwStatusCode = status{
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            // Decode the JSON data into LeagueSearchResult
                            let decoder = JSONDecoder()
                            let statHistory = try decoder.decode(StatHistory.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, statHistory)
                        } catch {
                            // Decoding error
                            completion("Failed to decode data", nil)
                        }
                        break
                    default:
                        completion("Failed to fetch data", nil)
                        break
                    }
                }

                    case .failure(let error):
                        // Network request failure
                        completion("Failed to fetch data: \(error.localizedDescription)", nil)
                    }
        }
    }
    
}
