//
//  FootBallAPIManager.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 2/2/24.
//

import Foundation
import Alamofire

class FootBallAPIManager {
    
    func getTimeZone(completion: @escaping (String?, TimeZoneResponse?)  -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/timezone"
        
        AF.request(url, method: .get, headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            
                            let decoder = JSONDecoder()
                            let timeZoneResponse = try decoder.decode(TimeZoneResponse.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, timeZoneResponse)
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
    
    func getCountries(completion: @escaping (String?, CountryResponse?)  -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/countries"
        
        AF.request(url, method: .get, headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(CountryResponse.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, response)
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
    
    func queryLeague(params: LeagueQueryParams, completion: @escaping (String?, LeagueResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/leagues"
        
        var parameters: [String: Any] = [:]
        if let id = params.id { parameters["id"] = id }
        if let name = params.name { parameters["name"] = name }
        if let country = params.country { parameters["country"] = country }
        if let code = params.code { parameters["code"] = code }
        if let season = params.season { parameters["season"] = season }
        if let team = params.team { parameters["team"] = team }
        if let type = params.type { parameters["type"] = type }
        if let current = params.current { parameters["current"] = current }
        if let search = params.search { parameters["search"] = search }
        if let last = params.last { parameters["last"] = last }
        
        AF.request(url, method: .get, parameters: parameters, headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(LeagueResponse.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, response)
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
    
    func queryLeagueSeasons(completion: @escaping (String?, LeagueSeasonsResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/leagues/seasons"
        
        AF.request(url, method: .get, headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode{
                    case 200...299:
                        do {
                            
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(LeagueSeasonsResponse.self, from: data ?? Data())
                            
                            // Call the completion closure with success
                            completion(nil, response)
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
    
    func queryTeams(params: TeamQueryParams, completion: @escaping (String?, TeamResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/teams"
        
        var parameters: [String: Any] = [:]
        if let id = params.id { parameters["id"] = id }
        if let name = params.name { parameters["name"] = name }
        if let league = params.league { parameters["league"] = league }
        if let season = params.season { parameters["season"] = season }
        if let country = params.country { parameters["country"] = country }
        if let code = params.code { parameters["code"] = code }
        if let venue = params.venue { parameters["venue"] = venue }
        if let search = params.search { parameters["search"] = search }
        
        AF.request(url, method: .get, parameters: parameters, headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(TeamResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    
    func queryTeamStatistics(params: TeamStatisticsQueryParams, completion: @escaping (String?, TeamStatisticsResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/teams/statistics"
        
        var parameters: [String: Any] = [
            "league": params.league,
            "season": params.season,
            "team": params.team
        ]
        
        if let date = params.date {
            parameters["date"] = date
        }
        
        AF.request(url, method: .get, parameters: parameters, headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(TeamStatisticsResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryTeamSeasons(params: TeamSeasonsQueryParams, completion: @escaping (String?, TeamSeasonsResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/teams/seasons"
        
        let parameters: [String: Any] = [
            "team": params.team
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: APIConfig.FOOTBALL_API_HEADERS).responseJSON { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        if let jsonData = data as? Data {
                            do {
                                let decoder = JSONDecoder()
                                let response = try decoder.decode(TeamSeasonsResponse.self, from: jsonData)
                                completion(nil, response)
                            } catch {
                                completion("Failed to decode data", nil)
                            }
                        } else {
                            completion("Failed to retrieve data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }

    
    func queryTeamCountries(completion: @escaping (String?, TeamCountryResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/teams/countries"
        
        AF.request(url, method: .get, headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(TeamCountryResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
        
    }
    
    func queryVenue(params: VenueQueryParams, completion: @escaping (String?, VenueResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/venues"
        
        var parameters: [String: Any] = [:]
        
        if let id = params.id {
            parameters["id"] = id
        }
        if let name = params.name {
            parameters["name"] = name
        }
        if let city = params.city {
            parameters["city"] = city
        }
        if let country = params.country {
            parameters["country"] = country
        }
        if let search = params.search {
            parameters["search"] = search
        }
        
        AF.request(url, method: .get, parameters: parameters, headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(VenueResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
        
    }
    
    func queryStandings(params: StandingsQueryParams, completion: @escaping (String?, StandingsResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/standings"
        
        var parameters: [String: Any] = [
            "league": params.league,
            "season": params.season
        ]
        
        if let team = params.team {
            parameters["team"] = team
        }
        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(StandingsResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryRounds(params: FixturesRoundQueryParams, completion: @escaping (String?, RoundsResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/fixtures/rounds"
        
        var parameters: [String: Any] = [
            "league": params.league,
            "season": params.season
        ]
        
        if let current = params.current {
            parameters["current"] = current
        }
        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(RoundsResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryFixtures(params: FixturesQueryParams, completion: @escaping (String?, FixtureResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/fixtures"
        
        
        var parameters: [String: Any] = [:]
        
        if let id = params.id {
            parameters["id"] = id
        }
        if let ids = params.ids {
            parameters["ids"] = ids.joined(separator: "-")
        }
        if let live = params.live {
            parameters["live"] = live
        }
        if let date = params.date {
            parameters["date"] = date
        }
        if let league = params.league {
            parameters["league"] = league
        }
        if let season = params.season {
            parameters["season"] = season
        }
        if let team = params.team {
            parameters["team"] = team
        }
        if let last = params.last {
            parameters["last"] = last
        }
        if let next = params.next {
            parameters["next"] = next
        }
        if let from = params.from {
            parameters["from"] = from
        }
        if let to = params.to {
            parameters["to"] = to
        }
        if let round = params.round {
            parameters["round"] = round
        }
        if let status = params.status {
            parameters["status"] = status
        }
        if let venue = params.venue {
            parameters["venue"] = venue
        }
        if let timezone = params.timezone {
            parameters["timezone"] = timezone
        }
        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(FixtureResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryHeadToHeadFixtures(params: HeadToHeadFixturesQueryParams, completion: @escaping (String?, HeadToHeadFixtureResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/fixtures/headtohead"
        
        var parameters: [String: Any] = [
            "h2h": params.h2h
        ]
        
        if let date = params.date {
            parameters["date"] = date
        }
        if let league = params.league {
            parameters["league"] = league
        }
        if let season = params.season {
            parameters["season"] = season
        }
        if let last = params.last {
            parameters["last"] = last
        }
        if let next = params.next {
            parameters["next"] = next
        }
        if let from = params.from {
            parameters["from"] = from
        }
        if let to = params.to {
            parameters["to"] = to
        }
        if let status = params.status {
            parameters["status"] = status
        }
        if let venue = params.venue {
            parameters["venue"] = venue
        }
        if let timezone = params.timezone {
            parameters["timezone"] = timezone
        }
        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(HeadToHeadFixtureResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryStatisticFixtures(params: FixtureStatisticsParameters, completion: @escaping (String?, TeamStatisticsResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/fixtures/statistics"
        
        var parameters: [String: Any] = [
            "team": params.team
        ]
        
        if let fixture = params.fixture {
            parameters["fixture"] = fixture
        }
        
        if let type = params.type {
            parameters["type"] = type
        }
        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(TeamStatisticsResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryEventFixtures(params: FixtureEventsParameters, completion: @escaping (String?, FixtureEventsResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/fixtures/events"
        
        var parameters: [String: Any] = [
            "fixture": params.fixture
        ]

        if let team = params.team {
            parameters["team"] = team
        }

        if let player = params.player {
            parameters["player"] = player
        }

        if let type = params.type {
            parameters["type"] = type
        }

        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(FixtureEventsResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryLineupFixtures(params: FixtureLineupsParameters, completion: @escaping (String?, FixtureLineupsResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/fixtures/lineups"
        
        var parameters: [String: Any] = [
            "fixture": params.fixture
        ]

        if let team = params.team {
            parameters["team"] = team
        }

        if let player = params.player {
            parameters["player"] = player
        }

        if let type = params.type {
            parameters["type"] = type
        }

        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(FixtureLineupsResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryPlayerStatFixtures(params: FixturePlayersParameters, completion: @escaping (String?, FixturePlayersResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/fixtures/players"
        
        var parameters: [String: Any] = [
            "fixture": params.fixture
        ]

        if let team = params.team {
            parameters["team"] = team
        }


        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(FixturePlayersResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    
    func queryInjuries(params: FixtureInjuriesParameters, completion: @escaping (String?, FixtureInjuriesResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/injuries"
        
        var parameters: [String: Any] = [:]
        
        if let fixture = params.fixture {
            parameters["fixture"] = fixture
        }

        if let team = params.team {
            parameters["team"] = team
        }

        if let league = params.league {
            parameters["league"] = league
        }

        if let season = params.season {
            parameters["season"] = season
        }

        if let player = params.player {
            parameters["player"] = player
        }

        if let date = params.date {
            parameters["date"] = date
        }

        if let timezone = params.timezone {
            parameters["timezone"] = timezone
        }


        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(FixtureInjuriesResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryCoach(params: CoachQueryParameters, completion: @escaping (String?, CoachResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/coachs"
        
        var parameters: [String: Any] = [:]
        
        if let id = params.id {
            parameters["id"] = id
        }

        if let team = params.team {
            parameters["team"] = team
        }

        if let search = params.search {
            parameters["search"] = search
        }

        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(CoachResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryPlayerSeason(params: PlayerSeasonsParameters, completion: @escaping (String?, PlayerSeasonsResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/players/season"
        
        var parameters: [String: Any] = [:]
        
        if let id = params.id {
            parameters["id"] = id
        }


        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(PlayerSeasonsResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    
    func queryPlayerStat(params: PlayerStatQueryParameters, completion: @escaping (String?, PlayerStatResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/players"
        
        var parameters: [String: Any] = [:]
        
        if let id = params.id {
            parameters["id"] = id
        }


        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(PlayerStatResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryPlayerSquad(params: SquadQueryParameters, completion: @escaping (String?, SquadResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/players/squads"
        
        var parameters: [String: Any] = [:]
        
        if let team = params.team {
            parameters["team"] = team
        }

        if let player = params.player {
            parameters["player"] = player
        }
        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(SquadResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryPlayerTransfer(params: TransferQueryParameters, completion: @escaping (String?, TransfersResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/transfers"
        
        var parameters: [String: Any] = [:]
        
        if let team = params.team {
            parameters["team"] = team
        }

        if let player = params.player {
            parameters["player"] = player
        }
        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(TransfersResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func queryTrophies(params: TrophiesParameters, completion: @escaping (String?, PlayerTrophiesResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/trophies"
        
        var parameters: [String: Any] = [:]
        
        if let coach = params.coach {
            parameters["coach"] = coach
        }

        if let player = params.player {
            parameters["player"] = player
        }
        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(PlayerTrophiesResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    func querySidelined(params: SidelinedParameters, completion: @escaping (String?, PlayerSidelinedResponse?) -> Void) {
        let url = APIConfig.FOOTBALL_API_BASE_URL + "/sidelined"
        
        var parameters: [String: Any] = [:]
        
        if let coach = params.coach {
            parameters["coach"] = coach
        }

        if let player = params.player {
            parameters["player"] = player
        }
        
        AF.request(url, method: .get, parameters: parameters,  headers: APIConfig.FOOTBALL_API_HEADERS).response { response in
            
            let status = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if let uwStatusCode = status {
                    switch uwStatusCode {
                    case 200...299:
                        do {
                            let decoder = JSONDecoder()
                            let response = try decoder.decode(PlayerSidelinedResponse.self, from: data ?? Data())
                            completion(nil, response)
                        } catch {
                            completion("Failed to decode data", nil)
                        }
                    default:
                        completion("Failed to fetch data", nil)
                    }
                }
                
            case .failure(let error):
                completion("Failed to fetch data: \(error.localizedDescription)", nil)
            }
        }
    }
    
    
}
