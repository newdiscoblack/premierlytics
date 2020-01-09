//  Created by Kacper Jagiello on 06/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation

struct Fixtures: Decodable {
    var count: Int
    var competition: LeagueDetails
    var matches: [Match]
}

struct LeagueDetails: Decodable {
    var id: Int
    var area: Country
    var name: String
    var code: String
}

struct Country: Decodable {
    var id: Int
    var name: String
}

struct Match: Decodable {
    var id: Int
    var season: Season
    var status: String
    var matchday: Int
    var score: Score
    var homeTeam: TeamName
    var awayTeam: TeamName
    var referees: [Referee]
}

struct Season: Decodable {
    var id: Int
    var startDate: String
    var endDate: String
    var currentMatchday: Int
}

struct Score: Decodable {
    var winner: String?
    var duration: String
    var fullTime: TeamsPlaying
    var halfTime: TeamsPlaying
    var extraTime: TeamsPlaying
    var penalties: TeamsPlaying
}

struct TeamsPlaying: Decodable {
    var homeTeam: Int?
    var awayTeam: Int?
}

struct TeamName: Decodable {
    var id: Int
    var name: String
}

struct Referees: Decodable {
    var referees: [Referee]?
}

struct Referee: Decodable {
    var id: Int
    var name: String
}

