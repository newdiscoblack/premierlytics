//  Created by Kacper Jagiello on 28/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import UIKit
import WebKit

final class MainViewController: UIViewController, WKNavigationDelegate {
    //MARK: variables
    private var selectedMatchweek = Int() {
        didSet {
            let premierLeagueFixturesDataAdress: String = AdressBook.fixtures
            let matchweekFixturesDataAdress = premierLeagueFixturesDataAdress + String(selectedMatchweek)
            let matchweekFixturesRequest = CreateRequest(fromAdress: matchweekFixturesDataAdress)

            matchweekFixturesRequest.getData(ofType: Fixtures.self) { [weak self] (expectedData, error) in
                guard error == nil else {
                    print("Cannot receive expected fixtures data.")
                    return
                }
                self?.premierLeagueGames = expectedData?.matches ?? []

                print("Received \(expectedData?.count ?? 0) fixtures from matchday \(self?.selectedMatchweek ?? 0).")
            }
        }
    }

    private var userInterface = MainUserInterface()

    private var premierLeagueGames = [Match]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                let selectedMatchWeek = self?.selectedMatchweek ?? 1
                
                self?.userInterface.currentlyDisplaying(matchweek: selectedMatchWeek)
                self?.userInterface.currentFixtures.reloadData()
                print("Fixtures from matchday \(selectedMatchWeek) displayed in the table.")
            }
        }
    }
    
    private var premierLeagueStandings = [Team]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                let premierLeagueStandings = self?.premierLeagueStandings ?? []
                let topThreeTeams = [premierLeagueStandings[0], premierLeagueStandings[1], premierLeagueStandings[2]]
                
                self?.userInterface.updateTopThree(teams: topThreeTeams)
                print("Top 3 teams updated and displayed.")
            }
        }
    }
    
    //MARK: button functions
    @objc private func visitPremierLeagueWebsite() {
        let premierLeagueWebsite = PremierLeagueWebsiteViewController()
        present(premierLeagueWebsite, animated: true)
    }
    
    @objc private func presentStandingsTableView() {
        let standingsTableView = StandingsTableViewController()
        navigationController?.pushViewController(standingsTableView, animated: true)
    }
    
    @objc private func displayPreviousFixtures() {
        selectedMatchweek -= 1
    }
    
    @objc private func displayComingFixtures() {
        selectedMatchweek += 1
    }
    
    //MARK: loadView
    override func loadView() {
        super.loadView()
        
        view = userInterface
    }
    
    //MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
        
        userInterface.currentFixtures.delegate = self
        userInterface.currentFixtures.dataSource = self
        userInterface.currentFixtures.register(MatchCustomCell.self, forCellReuseIdentifier: "matchCustomCell")
        
        userInterface.premierLeagueLogo.addTarget(nil, action: #selector(visitPremierLeagueWebsite), for: .touchUpInside)
        userInterface.viewWholeTable.addTarget(nil, action: #selector(presentStandingsTableView), for: .touchUpInside)
        userInterface.previousMatchweek.addTarget(nil, action: #selector(displayPreviousFixtures), for: .touchUpInside)
        userInterface.nextMatchweek.addTarget(nil, action: #selector(displayComingFixtures), for: .touchUpInside)
        
        userInterface.currentFixtures.reloadData()
        
        print("Main view is being presented.")
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        let premierLeagueTableDataAdress: String = AdressBook.leagueTable
        let premierLeagueTableRequest = CreateRequest(fromAdress: premierLeagueTableDataAdress)
        
        premierLeagueTableRequest.getData(ofType: PremierLeague.self) { [weak self] (expectedData, error) in
            guard error == nil else {
                print("Cannot receive current Premier League table data.")
                return
            }
            self?.premierLeagueStandings = expectedData?.standings.self[0].table ?? []
            self?.selectedMatchweek = expectedData?.season.currentMatchday ?? 1
            
            print("Premier League standings data recevied.")
        }
    }

    deinit {
        print("Main view deinitialized.")
    }
}
//MARK: UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return premierLeagueGames.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let matches = tableView.dequeueReusableCell(withIdentifier: "matchCustomCell", for: indexPath) as! MatchCustomCell
        matches.backgroundColor = .clear
        matches.selectionStyle = .none
        matches.match = premierLeagueGames[indexPath.row]
        
        return matches
    }

}
//MARK: UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = (Dimensions.screenHeight/1.5)/CGFloat(premierLeagueGames.count)
        return rowHeight
    }

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let matchDetails = MatchDetailsViewController()
        let match = premierLeagueGames[indexPath.row]
        let standings = premierLeagueStandings
        func getTeamStats(teamIdenficator: Int) -> (position: Int, points: Int) {
            var teamPosition: Int = 0
            var acumulatedPoints: Int = 0
            for team in standings {
                if team.team.id == teamIdenficator {
                    teamPosition = team.position
                    acumulatedPoints = team.points
                }
            }
            return (position: teamPosition, points: acumulatedPoints)
        }
        let teamnameFormatter = TeamnameFormatter()
        let homeTeamShortName = teamnameFormatter.displayThreeLetterTeamname(of: match.homeTeam.name)
        let awayTeamShortName = teamnameFormatter.displayThreeLetterTeamname(of: match.awayTeam.name)
        matchDetails.title = "\(homeTeamShortName) - \(awayTeamShortName)"

        matchDetails.homeTeam = (match.homeTeam.id, match.homeTeam.name, getTeamStats(teamIdenficator: match.homeTeam.id))
        matchDetails.awayTeam = (match.awayTeam.id, match.awayTeam.name, getTeamStats(teamIdenficator: match.awayTeam.id))

        matchDetails.matchStatus = match.status
        matchDetails.lastUpdate = match.lastUpdated
        
        let goalsFor = match.score.fullTime
        matchDetails.score = (goalsFor.homeTeam ?? 0, goalsFor.awayTeam ?? 0)
        matchDetails.matchDate = match.utcDate
        navigationController?.pushViewController(matchDetails, animated: true)
    }

    internal func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        selectedCell?.backgroundColor = .systemYellow
    }

    internal func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        selectedCell?.backgroundColor = .clear
    }
}
