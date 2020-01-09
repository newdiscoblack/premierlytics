//  Created by Kacper Jagiello on 28/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import UIKit
import WebKit

class StartingView: UIViewController, WKNavigationDelegate {
    
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height

    fileprivate var currentMatchday: Int = 1 //default value
    fileprivate let premierLeagueTableDataAdress: String = "https://api.football-data.org/v2/competitions/2021/standings"
    fileprivate var premierLeagueFixturesDataAdress: String = ""
    
    @objc private func displayPremierLeagueWebsite() {
        let premierLeagueWebsiteView = PremierLeagueWebsiteViewController()
        present(premierLeagueWebsiteView, animated: true)
    }
    
    @objc private func displayStandingsTableView() {
        let standingsTableView = StandingsTableView()
        present(standingsTableView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        let topBarElementsCount = 5
        let topBarElementSize = Int(screenWidth)/topBarElementsCount

        let backgroundImage: UIImageView = {
            let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
            backgroundImageView.image = UIImage(named: "premierLeagueBackground")
            backgroundImageView.contentMode = UIView.ContentMode.scaleAspectFill
            view.addSubview(backgroundImageView)
            return backgroundImageView
        }()
        
        let premierLeagueLogo: UIButton = {
            let topBarButtonSpace = UIButton(frame: CGRect(x: 0, y: 50, width: topBarElementSize, height: topBarElementSize))
            topBarButtonSpace.setImage(UIImage(named: "premierLeagueLogo"), for: .normal)
            topBarButtonSpace.addTarget(self, action: #selector(displayPremierLeagueWebsite), for: .touchUpInside)
            view.addSubview(topBarButtonSpace)
            return topBarButtonSpace
        }()
        
        let firstPlacedTeam: UIButton = {
            let topBarButtonSpace = UIButton()
            topBarButtonSpace.setEqualSizeAndPlaceNextTo(object: premierLeagueLogo)
            view.addSubview(topBarButtonSpace)
            return topBarButtonSpace
        }()
        
        let secondPlacedTeam: UIButton = {
            let topBarButtonSpace = UIButton()
            topBarButtonSpace.setEqualSizeAndPlaceNextTo(object: firstPlacedTeam)
            view.addSubview(topBarButtonSpace)
            return topBarButtonSpace
        }()

        let thirdPlacedTeam: UIButton = {
            let topBarButtonSpace = UIButton()
            topBarButtonSpace.setEqualSizeAndPlaceNextTo(object: secondPlacedTeam)
            view.addSubview(topBarButtonSpace)
            return topBarButtonSpace
        }()
        
        let viewWholeTable: UIButton = {
            let viewMoreButton = UIButton()
            viewMoreButton.setEqualSizeAndPlaceNextTo(object: thirdPlacedTeam)
            viewMoreButton.setTitle("●●●", for: .normal)
            viewMoreButton.titleLabel?.font = .systemFont(ofSize: 10.0)
            viewMoreButton.addTarget(self, action: #selector(displayStandingsTableView), for: .touchUpInside)
            view.addSubview(viewMoreButton)
            return viewMoreButton
        }()
        
        
        let currentFixtures = UIButton()
        currentFixtures.frame = CGRect(x: 10, y: premierLeagueLogo.frame.maxY + 40.0, width: screenWidth - 20, height: 400.0)
        currentFixtures.backgroundColor = .green
        currentFixtures.setTitle("CURRENT FIXTURES", for: .normal)
        view.addSubview(currentFixtures)
        
        let myQueue = DispatchQueue(label: "Test Queue")
        
        var premierLeagueStandings = [Team]() {
            didSet {
                DispatchQueue.main.async {
                    firstPlacedTeam.displayCrest(ofTeam: premierLeagueStandings[0].team.id)
                    firstPlacedTeam.displayAmountOfPoints(fromSource: premierLeagueStandings[0].points)
                    
                    secondPlacedTeam.displayCrest(ofTeam: premierLeagueStandings[1].team.id)
                    secondPlacedTeam.displayAmountOfPoints(fromSource: premierLeagueStandings[1].points)
                    
                    thirdPlacedTeam.displayCrest(ofTeam: premierLeagueStandings[2].team.id)
                    thirdPlacedTeam.displayAmountOfPoints(fromSource: premierLeagueStandings[2].points)
                    
                    print("done with test queue")
                }
            }
        }
        
        let premierLeague = CreateRequest(fromAdress: premierLeagueTableDataAdress)
        
        premierLeague.getStandingsData { result in
            switch result {
            case .failure(let receivedError):
                print(receivedError)
            case .success(let receivedData):
                premierLeagueStandings = receivedData.standings.self[0].table
                self.currentMatchday = receivedData.season.currentMatchday
                self.premierLeagueFixturesDataAdress = "https://api.football-data.org/v2/competitions/2021/matches?matchday=\(self.currentMatchday)"
            }
        }
        
        var premierLeagueGames = [Match]() {
            didSet {
                DispatchQueue.main.async {
                    
                    var fixturesString: String = "Gameweek \(premierLeagueGames[0].matchday) \n\n"
                    currentFixtures.titleLabel?.numberOfLines = premierLeagueGames.count+3
                    currentFixtures.titleLabel?.font = .systemFont(ofSize: 15.0)
                    currentFixtures.titleLabel?.textAlignment = .center
                    currentFixtures.setTitleColor(.black, for: .normal)
                    
                    for game in 0..<premierLeagueGames.count {
                        fixturesString += "\(premierLeagueGames[game].homeTeam.name) vs \(premierLeagueGames[game].awayTeam.name) \n"
                    }
                    
                    currentFixtures.setTitle(fixturesString, for: .normal)
                    
                    print("done after 2 seconds")

                }
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("RECEIVED ADRESS: \(self.premierLeagueFixturesDataAdress)")
            
            let premierLeagueFixtures = CreateRequest(fromAdress: self.premierLeagueFixturesDataAdress)
            
            premierLeagueFixtures.getFixtures { result in
                switch result {
                case .failure(let receivedError):
                    print(receivedError)
                case .success(let receivedData):
                    print("Received \(receivedData.count) fixtures.")
                    premierLeagueGames = receivedData.matches
                }
            }
        }
    }
    //outside viewDidLoad()
    
}







