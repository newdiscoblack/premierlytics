//  Created by Kacper Jagiello on 29/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import Foundation

struct Squad: Decodable {
    var id: Int
    var name: String
    var crestUrl: String?
    var clubColors: String
    var squad: [Player]
}

struct Player: Decodable {
    var name: String
    var position: String?
    var dateOfBirth: String?
    var countryOfBirth: String?
    var nationality: String?
    var role: String?
    var shirtNumber: Int?
}
