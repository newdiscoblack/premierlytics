//  Created by Kacper Jagiello on 06/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation

struct Fixtures: Decodable {
    let count: Int
    let competition: LeagueDetails
    let matches: [Match]
}

struct LeagueDetails: Decodable {
    let id: Int
    let area: Country
    let name: String
    let code: String
}

struct Country: Decodable {
    let id: Int
    let name: String
}

struct Match: Decodable {
    let id: Int
    let season: Season
    let utcDate: String
    let status: String
    let matchday: Int
    let lastUpdated: String?
    let score: Score
    let homeTeam: TeamName
    let awayTeam: TeamName
    let referees: [Referee]?
}

struct Season: Decodable {
    let id: Int
    let startDate: String
    let endDate: String
    let currentMatchday: Int
}

struct Score: Decodable {
    let winner: String?
    let duration: String
    let fullTime: TeamsPlaying
    let halfTime: TeamsPlaying
    let extraTime: TeamsPlaying
    let penalties: TeamsPlaying
}

struct TeamsPlaying: Decodable {
    let homeTeam: Int?
    let awayTeam: Int?
}

struct TeamName: Decodable {
    let id: Int
    let name: String
}

struct Referees: Decodable {
    let referees: [Referee]?
}

struct Referee: Decodable {
    let id: Int?
    let name: String?
}

