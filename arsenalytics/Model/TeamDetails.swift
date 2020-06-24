//  Created by Kacper Jagiello on 08/02/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation

struct TeamDetails: Decodable {
    let id: Int
    let activeCompetitions: [Competition]
    let name: String
    let clubColors: String
    let squad: [Player]
}

struct Player: Decodable {
    let id: Int
    let name: String
    let position: String?
    let dateOfBirth: String?
    let countryOfBirth: String?
    let nationality: String?
    let role: String?
    let shirtNumber: Int?
}

struct Competition: Decodable {
    let id: Int
    let area: Country
    let name: String
}
