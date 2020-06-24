//  Created by Kacper Jagiello on 01/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation

struct PremierLeague: Decodable {
    let season: Season
    let standings: [Standings]
}

struct Standings: Decodable {
    let table: [Team]
}

struct Team: Decodable {
    let position: Int
    let team: NameAndCrest
    let playedGames: Int
    let won: Int
    let draw: Int
    let lost: Int
    let points: Int
    let goalsFor: Int
    let goalsAgainst: Int
    let goalDifference: Int
}

struct NameAndCrest: Decodable {
    let id: Int
    let name: String
    let crestUrl: String
}
