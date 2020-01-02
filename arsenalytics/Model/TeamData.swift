//  Created by Kacper Jagiello on 25/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import Foundation

struct TeamList: Decodable {
    var teams: [TeamDetails]
}

struct TeamDetails: Decodable {
    var id: Int
    var name: String
    var shortName: String
    var tla: String
    var crestUrl: String?
    var founded: Int?
    var clubColors: String
    var venue: String
}
