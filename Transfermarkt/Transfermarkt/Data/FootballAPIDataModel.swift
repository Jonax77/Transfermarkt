//
//  FootballAPIDataModel.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 2/2/24.
//

import Foundation
import Combine

struct TimeZoneResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [String]
}

struct CountryResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [Country]
}


struct Country: Codable {
    let name: String
    let code: String
    let flag: String
}

struct LeagueResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [League]
}

struct Paging: Codable {
    let current: Int
    let total: Int
}

struct League: Codable {
    let league: LeagueInfo
    let country: Country
    let seasons: [Season]
}

struct LeagueInfo: Codable {
    let id: Int
    let name: String
    let type: String
    let logo: String
}

struct Season: Codable {
    let year: Int
    let start: String
    let end: String
    let current: Bool
    let coverage: Coverage
}

struct Coverage: Codable {
    let fixtures: FixtureCoverage
    let standings: Bool
    let players: Bool
    let top_scorers: Bool
    let top_assists: Bool
    let top_cards: Bool
    let injuries: Bool
    let predictions: Bool
    let odds: Bool
}

struct FixtureCoverage: Codable {
    let events: Bool
    let lineups: Bool
    let statistics_fixtures: Bool
    let statistics_players: Bool
}


struct LeagueQueryParams {
    let id: Int?
    let name: String?
    let country: String?
    let code: String?
    let season: Int?
    let team: Int?
    let type: String?
    let current: Bool?
    let search: String?
    let last: Int?
}

struct LeagueSeasonsResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [Int]
}


struct TeamResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [TeamDetails]
}

struct TeamDetails: Codable {
    let team: TeamDetail
    let venue: VenueInfo
}

struct TeamDetail: Codable {
    let id: Int
    let name: String
    let code: String
    let country: String
    let founded: Int
    let national: Bool
    let logo: String
}

struct VenueInfo: Codable {
    let id: Int
    let name: String
    let address: String
    let city: String
    let capacity: Int
    let surface: String
    let image: String
}

struct TeamQueryParams: Codable {
    let id: Int?
    let name: String?
    let league: Int?
    let season: Int?
    let country: String?
    let code: String?
    let venue: Int?
    let search: String?
}

struct TeamStatisticsResponse: Codable {
    let parameters: TeamStatisticsParameters
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: TeamStatisticsDetails
}

struct TeamStatisticsParameters: Codable {
    let team: String
    let season: String
    let league: String
}

struct TeamStatisticsDetails: Codable {
    let league: LeagueDetail
    let team: TeamInfo
    let form: String
    let fixtures: FixtureInfo
    let goals: GoalsInfo
    let biggest: BiggestInfo
    let cleanSheet: CleanSheetInfo
    let failedToScore: FailedToScoreInfo
    let penalty: PenaltyInfo
    let lineups: [LineupInfo]
    let cards: CardsInfo
}

struct LeagueDetail: Codable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String
    let season: Int
}

struct TeamInfo: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct FixtureInfo: Codable {
    let played: PlayedInfo
    let wins: PlayedInfo
    let draws: PlayedInfo
    let loses: PlayedInfo
}

struct PlayedInfo: Codable {
    let home: Int
    let away: Int
    let total: Int
}

struct GoalsInfo: Codable {
    let `for`: ForInfo
    let against: AgainstInfo
}

struct ForInfo: Codable {
    let total: TotalInfo
    let average: AverageInfo
    let minute: MinuteInfo
}

struct TotalInfo: Codable {
    let home: Int
    let away: Int
    let total: Int
}

struct AverageInfo: Codable {
    let home: String
    let away: String
    let total: String
}

struct MinuteInfo: Codable {
    let zeroToFifteen: MinuteDetail
    let sixteenToThirty: MinuteDetail
    let thirtyOneToFortyFive: MinuteDetail
    let fortySixToSixty: MinuteDetail
    let sixtyOneToSeventyFive: MinuteDetail
    let seventySixToNinety: MinuteDetail
    let ninetyOneToHundredFive: MinuteDetail?
    let hundredSixToHundredTwenty: MinuteDetail?

    enum CodingKeys: String, CodingKey {
        case zeroToFifteen = "0-15"
        case sixteenToThirty = "16-30"
        case thirtyOneToFortyFive = "31-45"
        case fortySixToSixty = "46-60"
        case sixtyOneToSeventyFive = "61-75"
        case seventySixToNinety = "76-90"
        case ninetyOneToHundredFive = "91-105"
        case hundredSixToHundredTwenty = "106-120"
    }
}


struct MinuteDetail: Codable {
    let total: Int?
    let percentage: String?
}

struct AgainstInfo: Codable {
    let total: TotalInfo
    let average: AverageInfo
    let minute: MinuteInfo
}

struct BiggestInfo: Codable {
    let streak: StreakInfo
    let wins: LocationInfo
    let loses: LocationInfo
    let goals: GoalsLocationInfo
}

struct StreakInfo: Codable {
    let wins: Int
    let draws: Int
    let loses: Int
}

struct LocationInfo: Codable {
    let home: String
    let away: String
}

struct GoalsLocationInfo: Codable {
    let `for`: GoalsLocationDetail
    let against: GoalsLocationDetail
}

struct GoalsLocationDetail: Codable {
    let home: Int
    let away: Int
}

struct CleanSheetInfo: Codable {
    let home: Int
    let away: Int
    let total: Int
}

struct FailedToScoreInfo: Codable {
    let home: Int
    let away: Int
    let total: Int
}

struct PenaltyInfo: Codable {
    let scored: ScoredInfo
    let missed: ScoredInfo
    let total: Int
}

struct ScoredInfo: Codable {
    let total: Int
    let percentage: String
}

struct LineupInfo: Codable {
    let formation: String
    let played: Int
}

struct CardsInfo: Codable {
    let yellow: CardDetail
    let red: CardDetail
}

struct CardDetail: Codable {
    let zeroToFifteen: CardDetailDetail
    let sixteenToThirty: CardDetailDetail
    let thirtyOneToFortyFive: CardDetailDetail
    let fortySixToSixty: CardDetailDetail
    let sixtyOneToSeventyFive: CardDetailDetail
    let seventySixToNinety: CardDetailDetail
    let ninetyOneToHundredFive: CardDetailDetail?
    let hundredSixToHundredTwenty: CardDetailDetail?

    enum CodingKeys: String, CodingKey {
        case zeroToFifteen = "0-15"
        case sixteenToThirty = "16-30"
        case thirtyOneToFortyFive = "31-45"
        case fortySixToSixty = "46-60"
        case sixtyOneToSeventyFive = "61-75"
        case seventySixToNinety = "76-90"
        case ninetyOneToHundredFive = "91-105"
        case hundredSixToHundredTwenty = "106-120"
    }
}


struct CardDetailDetail: Codable {
    let total: Int?
    let percentage: String?
}

struct TeamStatisticsQueryParams {
    let league: Int
    let season: String
    let team: Int
    let date: String?
}

struct TeamSeasonsResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [Int]
}

struct TeamSeasonsQueryParams: Codable {
    let team: String
}

struct TeamCountryResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [TeamCountry]
}

struct TeamCountry: Codable {
    let name: String
    let code: String
    let flag: String
}


struct VenueResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [Venue]
}

struct VenueQueryParams {
    let id: Int?
    let name: String?
    let city: String?
    let country: String?
    let search: String?
}

struct Venue: Codable {
    let id: Int
    let name: String
    let address: String
    let city: String
    let country: String
    let capacity: Int
    let surface: String
    let image: String
}

struct StandingsResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [StandingsEntry]
}

struct StandingsParameters: Codable {
    let league: String
    let season: String
}

struct StandingsEntry: Codable {
    let league: LeagueInfoForStanding
    let standings: [[StandingInfo]]
}

struct LeagueInfoForStanding: Codable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String
    let season: Int
}

struct StandingInfo: Codable {
    let rank: Int
    let team: TeamInfoForStanding
    let points: Int
    let goalsDiff: Int
    let group: String
    let form: String
    let status: String
    let description: String
    let all: StandingDetail
    let home: StandingDetail
    let away: StandingDetail
    let update: String
}

struct TeamInfoForStanding: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct StandingDetail: Codable {
    let played: Int
    let win: Int
    let draw: Int
    let lose: Int
    let goals: GoalInfo
}

struct GoalInfo: Codable {
    let `for`: Int
    let against: Int
}

struct StandingsQueryParams {
    let league: Int
    let season: String
    let team: Int?
}

struct RoundsResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [String]
}

struct FixturesRoundQueryParams {
    let league: Int
    let season: String
    let current: Bool?
}

struct FixtureResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [FixtureDetail]
}

struct FixtureDetail: Codable {
    let fixture: Fixture
    let league: LeagueForFixture
    let teams: Teams
    let goals: Goals
    let score: Score
}

struct Fixture: Codable {
    let id: Int
    let referee: String?
    let timezone: String
    let date: String
    let timestamp: Int
    let periods: Periods
    let venue: VenueForFixture
    let status: Status
}

struct Periods: Codable {
    let first: Int
    let second: Int?
}

struct VenueForFixture: Codable {
    let id: Int
    let name: String
    let city: String
}

struct Status: Codable {
    let long, short: String
    let elapsed: Int
}

struct LeagueForFixture: Codable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String
    let season: Int
    let round: String
}

struct Teams: Codable {
    let home: Team
    let away: Team
}

struct Team: Codable {
    let id: Int
    let name: String
    let logo: String
    let winner: Bool
}

struct Goals: Codable {
    let home, away: Int
}

struct Score: Codable {
    let halftime, fulltime, extratime, penalty: ScoreDetail
}

struct ScoreDetail: Codable {
    let home, away: Int?
}

struct FixturesQueryParams {
    let id: Int?
    let ids: [String]?
    let live: String?
    let date: String?
    let league: Int?
    let season: String?
    let team: Int?
    let last: Int?
    let next: Int?
    let from: String?
    let to: String?
    let round: String?
    let status: String?
    let venue: Int?
    let timezone: String?
}


enum FixtureStatus: String, CaseIterable {
    case TBD = "TBD"
    case NS = "NS"
    case FirstHalf = "1H"
    case Halftime = "HT"
    case SecondHalf = "2H"
    case ExtraTime = "ET"
    case BreakTime = "BT"
    case PenaltyInProgress = "P"
    case MatchSuspended = "SUSP"
    case MatchInterrupted = "INT"
    case MatchFinished = "FT"
    case MatchFinishedAET = "AET"
    case MatchFinishedPEN = "PEN"
    case MatchPostponed = "PST"
    case MatchCancelled = "CANC"
    case MatchAbandoned = "ABD"
    case TechnicalLoss = "AWD"
    case WalkOver = "WO"
    case Live = "LIVE"
    
    var description: String {
        switch self {
        case .TBD:
            return "Time To Be Defined - Scheduled but date and time are not known"
        case .NS:
            return "Not Started - Scheduled"
        case .FirstHalf:
            return "First Half, Kick Off - In Play - First half in play"
        case .Halftime:
            return "Halftime - In Play - Finished in the regular time"
        case .SecondHalf:
            return "Second Half, 2nd Half Started - In Play - Second half in play"
        case .ExtraTime:
            return "Extra Time - In Play - Extra time in play"
        case .BreakTime:
            return "Break Time - In Play - Break during extra time"
        case .PenaltyInProgress:
            return "Penalty In Progress - In Play - Penalty played after extra time"
        case .MatchSuspended:
            return "Match Suspended - In Play - Suspended by referee's decision, may be rescheduled another day"
        case .MatchInterrupted:
            return "Match Interrupted - In Play - Interrupted by referee's decision, should resume in a few minutes"
        case .MatchFinished:
            return "Match Finished - Finished - Finished in the regular time"
        case .MatchFinishedAET:
            return "Match Finished - Finished - Finished after extra time without going to the penalty shootout"
        case .MatchFinishedPEN:
            return "Match Finished - Finished - Finished after the penalty shootout"
        case .MatchPostponed:
            return "Match Postponed - Postponed - Postponed to another day, once the new date and time is known the status will change to Not Started"
        case .MatchCancelled:
            return "Match Cancelled - Cancelled - Cancelled, match will not be played"
        case .MatchAbandoned:
            return "Match Abandoned - Abandoned - Abandoned for various reasons (Bad Weather, Safety, Floodlights, Playing Staff Or Referees), Can be rescheduled or not, it depends on the competition"
        case .TechnicalLoss:
            return "Technical Loss - Not Played"
        case .WalkOver:
            return "WalkOver - Not Played - Victory by forfeit or absence of competitor"
        case .Live:
            return "In Progress - In Play - Used in very rare cases. It indicates a fixture in progress but the data indicating the half-time or elapsed time are not available"
        }
    }
}

struct HeadToHeadFixtureResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [HeadToHeadFixture]
}

struct HeadToHeadFixture: Codable {
    let fixture: FixtureHeadToHead
    let league: LeagueHeadToHead
    let teams: TeamsHeadToHead
    let goals: GoalsHeadToHead
    let score: ScoreHeadToHead
}

struct HeadToHeadFixturesQueryParams {
    let h2h: String
    let date: String?
    let league: Int?
    let season: Int?
    let last: Int?
    let next: Int?
    let from: String?
    let to: String?
    let status: String?
    let venue: Int?
    let timezone: String?
}


struct FixtureHeadToHead: Codable {
    let id: Int
    let referee: String?
    let timezone: String
    let date: String
    let timestamp: Int
    let periods: PeriodsHeadToHead
    let venue: VenueHeadToHead
    let status: StatusHeadToHead
}

struct PeriodsHeadToHead: Codable {
    let first: Int
    let second: Int?
}

struct VenueHeadToHead: Codable {
    let id: Int
    let name: String
    let city: String
}

struct StatusHeadToHead: Codable {
    let long: String
    let short: String
    let elapsed: Int
}

struct LeagueHeadToHead: Codable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String
    let season: Int
    let round: String
}

struct TeamsHeadToHead: Codable {
    let home: TeamHeadToHead
    let away: TeamHeadToHead
}

struct TeamHeadToHead: Codable {
    let id: Int
    let name: String
    let logo: String
    let winner: Bool
}

struct GoalsHeadToHead: Codable {
    let home: Int
    let away: Int
}

struct ScoreHeadToHead: Codable {
    let halftime: HalftimeHeadToHead
    let fulltime: FulltimeHeadToHead
    let extratime: ExtratimeHeadToHead?
    let penalty: PenaltyHeadToHead?
}

struct HalftimeHeadToHead: Codable {
    let home: Int
    let away: Int
}

struct FulltimeHeadToHead: Codable {
    let home: Int
    let away: Int
}

struct ExtratimeHeadToHead: Codable {
    let home: Int?
    let away: Int?
}

struct PenaltyHeadToHead: Codable {
    let home: Int?
    let away: Int?
}


enum FixtureStatisticType: String, Codable {
    case shotsOnGoal = "Shots on Goal"
    case shotsOffGoal = "Shots off Goal"
    case shotsInsideBox = "Shots insidebox"
    case shotsOutsideBox = "Shots outsidebox"
    case totalShots = "Total Shots"
    case blockedShots = "Blocked Shots"
    case fouls = "Fouls"
    case cornerKicks = "Corner Kicks"
    case offsides = "Offsides"
    case ballPossession = "Ball Possession"
    case yellowCards = "Yellow Cards"
    case redCards = "Red Cards"
    case goalkeeperSaves = "Goalkeeper Saves"
    case totalPasses = "Total passes"
    case passesAccurate = "Passes accurate"
    case passesPercentage = "Passes %"
}

struct FixtureStatisticsResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [FixtureStatistics]
}

struct FixtureStatisticsParameters: Codable {
    let team: String
    let fixture: String?
    let type: String?
}

struct FixtureStatistics: Codable {
    let team: TeamForFixture
    let statistics: [StatisticForFixture]
}

struct TeamForFixture: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct StatisticForFixture: Codable {
    let type: FixtureStatisticType
    let value: String?
}

struct FixtureEventsResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [FixtureEvent]
}



struct FixtureEvent: Codable {
    let time: EventTime
    let team: TeamForEvent
    let player: PlayerForEvent
    let assist: AssistForEvent
    let type: String
    let detail: String
    let comments: String?
}

struct EventTime: Codable {
    let elapsed: Int
    let extra: String?
}

struct TeamForEvent: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct PlayerForEvent: Codable {
    let id: Int
    let name: String
}

struct AssistForEvent: Codable {
    let id: Int?
    let name: String?
}

struct FixtureEventsParameters: Codable {
    let fixture: Int
    let team: Int?
    let player: Int?
    let type: String?
}

enum EventType: String {
    case yellowCard = "Yellow Card"
    case redCard = "Red Card"
    case substitution = "Subst"
    case normalGoal = "Normal Goal"
    case ownGoal = "Own Goal"
    case penalty = "Penalty"
    case missedPenalty = "Missed Penalty"
    case goalCancelled = "Goal cancelled"
    case penaltyConfirmed = "Penalty confirmed"
}


struct FixtureLineupsResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [FixtureLineup]
}

struct FixtureLineup: Codable {
    let team: TeamLineup
    let formation: String
    let startXI: [PlayerLineup]
    let substitutes: [PlayerLineup]
    let coach: CoachForLineup
}

struct TeamLineup: Codable {
    let id: Int
    let name: String
    let logo: String
    let colors: TeamColors
}

struct TeamColors: Codable {
    let player: PlayerColors
    let goalkeeper: PlayerColors
}

struct PlayerColors: Codable {
    let primary: String
    let number: String
    let border: String
}

struct PlayerLineup: Codable {
    let player: Player
}

struct CoachForLineup: Codable {
    let id: Int
    let name: String
    let photo: String
}

struct Player: Codable {
    let id: Int
    let name: String
    let number: Int
    let pos: String
    let grid: String?
}

struct FixtureLineupsParameters: Codable {
    let fixture: Int
    let team: Int?
    let player: Int?
    let type: String?
}

struct FixturePlayersResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [FixturePlayer]
}


struct FixturePlayer: Codable {
    let team: Team
    let players: [PlayerStatistics]
}

struct PlayerStatistics: Codable {
    let player: PlayerForStat
    let statistics: PlayerStatisticsDetail
}

struct PlayerForStat: Codable {
    let id: Int
    let name: String
    let photo: String
}

struct PlayerStatisticsDetail: Codable {
    let games: Games
    let offsides: Int?
    let shots: Shots
    let goals: GoalsForStat
    let passes: Passes
    let tackles: Tackles
    let duels: Duels
    let dribbles: Dribbles
    let fouls: Fouls
    let cards: Cards
    let penalty: Penalty
}

struct Games: Codable {
    let minutes: Int
    let number: Int
    let position: String
    let rating: String
    let captain: Bool
    let substitute: Bool
}

struct Shots: Codable {
    let total: Int
    let on: Int
}

struct GoalsForStat: Codable {
    let total: Int?
    let conceded: Int
    let assists: Int?
    let saves: Int
}

struct Passes: Codable {
    let total: Int
    let key: Int
    let accuracy: String
}

struct Tackles: Codable {
    let total: Int?
    let blocks: Int
    let interceptions: Int
}

struct Duels: Codable {
    let total: Int?
    let won: Int?
}

struct Dribbles: Codable {
    let attempts: Int
    let success: Int
    let past: Int?
}

struct Fouls: Codable {
    let drawn: Int
    let committed: Int
}

struct Cards: Codable {
    let yellow: Int
    let red: Int
}

struct Penalty: Codable {
    let won: Int?
    let commited: Int?
    let scored: Int
    let missed: Int
    let saved: Int
}

struct FixturePlayersParameters: Codable {
    let fixture: Int
    let team: Int?
}

struct FixtureInjuriesResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [InjuryInfo]
}

struct FixtureInjuriesParameters: Codable {
    let league: Int?
    let season: String?
    let fixture: Int?
    let team: Int?
    let player: Int?
    let date: String?
    let timezone: String?
}


struct InjuryInfo: Codable {
    let player: InjuredPlayer
    let team: TeamForInjury
    let fixture: FixtureForInjury
    let league: LeagueForInjury
}

struct InjuredPlayer: Codable {
    let id: Int
    let name: String
    let photo: String
    let type, reason: String
}

struct TeamForInjury: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct FixtureForInjury: Codable {
    let id: Int
    let timezone, date: String
    let timestamp: Int
}

struct LeagueForInjury: Codable {
    let id: Int
    let season: Int
    let name, country: String
    let logo: String?
    let flag: String?
}

struct CoachResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [Coach]
}

struct CoachQueryParameters {
    let id: Int?
    let team: Int?
    let search: String?
}



struct Coach: Codable {
    let id: Int
    let name: String
    let firstname: String
    let lastname: String
    let age: Int
    let birth: Birth
    let nationality: String
    let height: String
    let weight: String
    let photo: String
    let team: TeamForCoach
    let career: [CoachCareer]
}

struct Birth: Codable {
    let date: String
    let place: String
    let country: String
}

struct TeamForCoach: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct CoachCareer: Codable {
    let team: Team
    let start: String
    let end: String?
}

struct PlayerSeasonsResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [Int]
}

struct PlayerSeasonsParameters: Codable {
    var id: String?
}

struct PlayerStatResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [PlayerData]
}


struct PlayerData: Codable {
    let player: PlayerInfo
    let statistics: [PlayerStatistics]
}

struct PlayerInfo: Codable {
    let id: Int
    let name: String
    let firstname: String
    let lastname: String
    let age: Int
    let birth: BirthForPlayer
    let nationality: String
    let height: String
    let weight: String
    let injured: Bool
    let photo: String
}

struct BirthForPlayer: Codable {
    let date: String
    let place: String
    let country: String
}

struct PlayerStatisticsForPlayer: Codable {
    let team: TeamForPlayer
    let league: LeagueForPlayer
    let games: GamesForPlayer
    let substitutes: SubstitutesForPlayer
    let shots: ShotsForPlayer
    let goals: GoalsForPlayer
    let passes: PassesForPlayer
    let tackles: TacklesForPlayer
    let duels: DuelsForPlayer
    let dribbles: DribblesForPlayer
    let fouls: FoulsForPlayer
    let cards: CardsForPlayer
    let penalty: PenaltyForPlayer
}


struct TeamForPlayer: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct LeagueForPlayer: Codable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String
    let season: Int
}

struct GamesForPlayer: Codable {
    let appearences: Int
    let lineups: Int
    let minutes: Int
    let number: Int?
    let position: String
    let rating: String
    let captain: Bool
}

struct SubstitutesForPlayer: Codable {
    let `in`: Int
    let out: Int
    let bench: Int
}

struct ShotsForPlayer: Codable {
    let total: Int
    let on: Int
}

struct GoalsForPlayer: Codable {
    let total: Int
    let conceded: Int?
    let assists: Int
    let saves: Int
}

struct PassesForPlayer: Codable {
    let total: Int
    let key: Int
    let accuracy: Int
}

struct TacklesForPlayer: Codable {
    let total: Int
    let blocks: Int
    let interceptions: Int
}

struct DuelsForPlayer: Codable {
    let total: Int?
    let won: Int?
}

struct DribblesForPlayer: Codable {
    let attempts: Int
    let success: Int
    let past: Int?
}

struct FoulsForPlayer: Codable {
    let drawn: Int
    let committed: Int
}

struct CardsForPlayer: Codable {
    let yellow: Int
    let yellowred: Int
    let red: Int
}

struct PenaltyForPlayer: Codable {
    let won: Int
    let commited: Int?
    let scored: Int
    let missed: Int
    let saved: Int?
}

struct PlayerStatQueryParameters: Codable {
    let id: Int?
    let team: Int?
    let league: Int?
    let season: String?
    let search: String?
    let page: Int
}

struct SquadResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [Squad]
}

struct Squad: Codable {
    let team: TeamForSquad
    let players: [PlayerForSquad]
}

struct TeamForSquad: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct PlayerForSquad: Codable {
    let id: Int
    let name: String
    let age: Int
    let number: Int?
    let position: String
    let photo: String
}

struct SquadQueryParameters {
    let team: Int?
    let player: Int?
}

struct TransfersResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [TransferInfo]
}


struct TransferInfo: Codable {
    let player: PlayerInfoForTransfer
    let update: String
    let transfers: [TransferDetail]
}

struct PlayerInfoForTransfer: Codable {
    let id: Int
    let name: String
}

struct TransferDetail: Codable {
    let date: String
    let type: String?
    let teams: Teams
}

struct TeamsForTransfer: Codable {
    let `in`: TeamForTransfer
    let out: TeamForTransfer
}

struct TeamForTransfer: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct TransferQueryParameters: Codable {
    var player: Int?
    let team: Int?
}

struct PlayerTrophiesResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [Trophy]
}


struct Trophy: Codable {
    let league: String
    let country: String
    let season: String
    let place: String
}

struct TrophiesParameters: Codable {
    var player: Int?
    var coach: Int?
}

struct PlayerSidelinedResponse: Codable {
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [SidelinedInfo]
}

struct SidelinedInfo: Codable {
    let type: String
    let start: String
    let end: String
}

struct SidelinedParameters: Codable {
    var player: Int?
    var coach: Int?
}
