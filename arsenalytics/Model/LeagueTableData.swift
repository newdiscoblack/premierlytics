//  Created by Kacper Jagiello on 01/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation

struct PremierLeague: Decodable {
    var standings: [Standings]
}

struct Standings: Decodable {
    var table: [Team]
}

struct Team: Decodable {
    var position: Int
    var team: NameAndCrest
    var playedGames: Int
    var won: Int
    var draw: Int
    var lost: Int
    var points: Int
    var goalsFor: Int
    var goalsAgainst: Int
    var goalDifference: Int
}

struct NameAndCrest: Decodable {
    var id: Int
    var name: String
    var crestUrl: String
}
