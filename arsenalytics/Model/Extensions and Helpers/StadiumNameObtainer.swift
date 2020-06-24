//  Created by Kacper on 04/02/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation

struct StadiumNameObtainer {
    static func getName(teamIdentificator identificator: Int) -> String {
        switch identificator {
        case 57:
            return "Emirates Stadium"
        case 58:
            return "Villa Park"
        case 61:
            return "Stamford Bridge"
        case 62:
            return "Goodison Park"
        case 64:
            return "Anfield"
        case 65:
            return "Etihad Stadium"
        case 66:
            return "Old Trafford"
        case 67:
            return "St James' Park"
        case 68:
            return "Carrow Road"
        case 73:
            return "White Hart Lane"
        case 76:
            return "Molineux"
        case 328:
            return "Turf Moor"
        case 338:
            return "King Power Stadium"
        case 340:
            return "St Mary's Stadium"
        case 346:
            return "Vicarage Road"
        case 354:
            return "Selhurst Park"
        case 356:
            return "Bramall Lane"
        case 397:
            return "Amex Stadium"
        case 563:
            return "Olympic Stadium"
        case 1044:
            return "Vitality Stadium"
        default:
            return "Coulnd't get the data."
        }
    }
}
