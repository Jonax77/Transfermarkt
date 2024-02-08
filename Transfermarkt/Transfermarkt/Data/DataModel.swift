//
//  DataModel.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/16/24.
//

import Foundation
import Combine

struct League1: Codable {
    var id: String?
    var name: String?
    var country: String?
    var clubs: String?
    var players: String?
    var totalMarketValue: String?
    var meanMarketValue: String?
    var continent: String?
}

struct LeagueSearchResult: Codable {
    var query: String?
    var pageNumber: Int?
    var lastPageNumber: Int?
    var results: [League1]?
    var updatedAt: String?
}

struct ClubInLeague: Codable {
    var id: String?
    var name: String?
}

struct ClubInLeagueList: Codable {
    var id: String?
    var name: String?
    var seasonID: String?
    var clubs: [ClubInLeague]?
    var updatedAt: String?
}

struct ClubSearchResult: Codable {
    var query: String?
    var pageNumber: Int?
    var lastPageNumber: Int?
    var results: [ClubBriefInfo]?
    var updatedAt: String?
}

struct ClubBriefInfo: Codable {
    var id: String?
    var url: String?
    var name: String?
    var country: String?
    var squad: String?
    var marketValue: String?
}

struct ClubProfile: Codable {
    var id: String?
    var url: String?
    var name: String?
    var officialName: String?
    var image: String?
    var legalForm: String?
    var addressLine1: String?
    var addressLine2: String?
    var addressLine3: String?
    var tel: String?
    var fax: String?
    var website: String?
    var foundedOn: String?
    var members: String?
    var membersDate: String?
    var otherSports: [String]?
    var colors: [String]?
    var stadiumName: String?
    var stadiumSeats: String?
    var currentTransferRecord: String?
    var currentMarketValue: String?
    var squad: SquadInClub?
    var league: LeagueInClub?
    var historicalCrests: [String]?
    var updatedAt: String?
}

struct SquadInClub: Codable {
    var size: String?
    var averageAge: String?
    var foreigners: String?
    var nationalTeamPlayers: String?
}

struct LeagueInClub: Codable {
    var id: String?
    var name: String?
    var countryID: String?
    var countryName: String?
    var tier: String?
}

struct PlayerInSquad: Codable {
    var id: String?
    var name: String?
    var position: String?
    var dateOfBirth: String?
    var age: String?
    var nationality: [String]?
    var height: String?
    var foot: String?
    var joinedOn: String?
    var joined: String?
    var signedFrom: String?
    var contract: String?
    var marketValue: String?
    var status: String?
}

struct PlayerInSquadList: Codable {
    var query: String?
    var pageNumber: Int?
    var lastPageNumber: Int?
    var results: [PlayerInSquad]?
    var updatedAt: String?
}

struct ClubInPlayerSearch: Codable {
    var name: String?
    var id: String?
}

struct PlayerSearchModel: Codable {
    var id: String?
    var name: String?
    var position: String?
    var club: ClubInPlayerSearch?
    var age: String?
    var nationalities: [String]?
    var marketValue: String?
}

struct PlayerSearchResult: Codable {
    var query: String?
    var pageNumber: Int?
    var lastPageNumber: Int?
    var results: [PlayerSearchModel]?
    var updatedAt: String?
}

struct PlaceOfBirth: Codable {
    var city: String?
    var country: String?
}

struct Position: Codable {
    var main: String?
    var other: [String]?
}

struct ClubInPlayerProfile: Codable {
    var id: String?
    var name: String?
    var joined: String?
    var contractExpires: String?
}

struct Agent: Codable {
    var name: String?
    var url: String?
}

struct PlayerProfile: Codable {
    var id: String?
    var url: String?
    var name: String?
    var description: String?
    var nameInHomeCountry: String?
    var imageURL: String?
    var dateOfBirth: String?
    var placeOfBirth: PlaceOfBirth?
    var age: String?
    var height: String?
    var citizenship: [String]?
    var isRetired: Bool?
    var position: Position?
    var foot: String?
    var shirtNumber: String?
    var club: ClubInPlayerProfile?
    var marketValue: String?
    var agent: Agent?
    var outfitter: String?
    var socialMedia: [String]?
    var updatedAt: String?
}

struct MarketValue: Codable {
    var age: String?
    var date: String?
    var clubName: String?
    var value: String?
    var clubID: String?
}

struct MarketValueRanking: Codable {
    var Worldwide: String?
}

struct MarketValueHistory: Codable {
    var id: String?
    var marketValue: String?
    var marketValueHistory: [MarketValue]?
    var ranking: MarketValueRanking?
    var updatedAt: String?
    
}

struct ClubInTransfer: Codable {
    var clubID: String?
    var clubName: String?
}

struct Transfer: Codable {
    var id: String?
    var from: ClubInTransfer?
    var to: ClubInTransfer?
    var date: String?
    var upcoming: Bool?
    var season: String?
    var marketValue: String?
    var fee: String?
}

struct TransferHistory: Codable {
    var id: String?
    var transfers: [Transfer]?
    var youthClubs: [String]?
    var updatedAt: String?
}

struct Stat: Codable {
    var competitionID: String?
    var clubID: String?
    var seasonID: String?
    var competitionName: String?
    var appearances: String?
    var goals: String?
    var assists: String?
    var yellowCards: String?
    var redCards: String?
    var minutesPlayed: String?
}

struct StatHistory: Codable {
    var id: String?
    var stats: [Stat]?
    var updatedAt: String?
}

struct Injury: Codable {
    var season: String?
    var injury: String?
    var from: String?
    var until: String?
    var days: String?
    var gamesMissed: String?
    var gamesMissedClubs: [String]?
}

struct InjuryHistory: Codable {
    var id: String?
    var pageNumber: Int?
    var lastPageNumber: Int?
    var injuries: [Injury]?
    var updatedAt: String?
}

struct ErrorModel: Codable {
    var msg: String?
    var type: String?
}

struct ErrorDetail: Codable {
    var detail: [ErrorModel]?
}
