//  Created by Kacper on 04/02/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation

final class TeamnameFormatter {
    init() {}
    
    func displayTeamname(of team: String) -> String {
        switch team {
        case "AFC Bournemouth":
            return team
        default:
            return String(Array(team)[0...Array(team).count-4])
        }
    }
    
    func displayThreeLetterTeamname(of team: String) -> String {
        switch team {
        case "Arsenal FC":
            return "ARS"
        case "Liverpool FC":
            return "LIV"
        case "Manchester City FC":
            return "MCI"
        case "Leicester City FC":
            return "LEI"
        case "Chelsea FC":
            return "CHE"
        case "Manchester United FC":
            return "MUN"
        case "Sheffield United FC":
            return "SHU"
        case "Wolverhampton Wanderers FC":
            return "WOL"
        case "Tottenham Hotspur FC":
            return "TOT"
        case "Crystal Palace FC":
            return "CRY"
        case "Everton FC":
            return "EVE"
        case "Southampton FC":
            return "SOU"
        case "Newcastle United FC":
            return "NEW"
        case "Brighton & Hove Albion FC":
            return "BHA"
        case "Burnley FC":
            return "BUR"
        case "West Ham United FC":
            return "WHU"
        case "Watford FC":
            return "WAT"
        case "Aston Villa FC":
            return "AVL"
        case "AFC Bournemouth":
            return "BOU"
        case "Norwich City FC":
            return "NOR"
        default:
            return "???"
        }
    }
}
