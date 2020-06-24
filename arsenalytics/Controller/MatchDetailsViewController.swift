//  Created by Kacper Jagiello on 02/02/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

final class MatchDetailsViewController: UIViewController {
    //MARK: variables
    private var userInterface = MatchDetailsUserInterface()

    var homeTeam: (id: Int, name: String, stats: (position: Int, points: Int))?
    var awayTeam: (id: Int, name: String, stats: (position: Int, points: Int))?
    
    var matchStatus: String?
    var lastUpdate: String?
    var score: (homeTeam: Int, awayTeam: Int)?
    var matchDate: String?
    
    //MARK: loadView
    override func loadView() {
        super.loadView()
        
        view = userInterface
    }
    //MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
        userInterface.displayStadium(ofHomeTeam: homeTeam?.id ?? 001)
        userInterface.displayTeamDetails(homeTeam: homeTeam ?? (001, "", (0, 0)), awayTeam: awayTeam ?? (001, "", (0, 0)))
        userInterface.displayMatchResult(matchDate: matchDate, matchStatus: matchStatus, score: score)

        let matchStarted = DateObtainer(date: matchDate ?? "")
        let matchUpdated = DateObtainer(date: lastUpdate ?? "")

        userInterface.updateGameProgress(status: matchStatus, gameStartedAt: matchStarted.displayGametime(), lastStatusUpdate: matchUpdated.displayGametime())
    }
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if homeTeam?.name != nil && awayTeam?.name != nil && matchStatus != nil {
            print("Details of the \(matchStatus!) match between \(homeTeam!.name) and \(awayTeam!.name) presented.")
        }
    }
    
    deinit {
        print("Match details view deinitialized")
    }
}

