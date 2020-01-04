//  Created by Kacper Jagiello on 28/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import UIKit
import WebKit

class StartingView: UIViewController, WKNavigationDelegate {
    
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    private let premierLeagueTableDataAdress: String = "https://api.football-data.org/v2/competitions/2021/standings"
    
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
        
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        backgroundImage.image = UIImage(named: "premierLeagueBackground")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.addSubview(backgroundImage)
        
        let premierLeagueLogo = UIButton(frame: CGRect(x: 0, y: 50, width: topBarElementSize, height: topBarElementSize))
        premierLeagueLogo.setImage(UIImage(named: "premierLeagueLogo"), for: .normal)
        premierLeagueLogo.addTarget(self, action: #selector(displayPremierLeagueWebsite), for: .touchUpInside)
        view.addSubview(premierLeagueLogo)
        
        let firstPlacedTeam = UIButton()
        firstPlacedTeam.setEqualSizeAndPlaceNextTo(object: premierLeagueLogo)
        view.addSubview(firstPlacedTeam)
        
        let secondPlacedTeam = UIButton()
        secondPlacedTeam.setEqualSizeAndPlaceNextTo(object: firstPlacedTeam)
        view.addSubview(secondPlacedTeam)
        
        let thirdPlacedTeam = UIButton()
        thirdPlacedTeam.setEqualSizeAndPlaceNextTo(object: secondPlacedTeam)
        view.addSubview(thirdPlacedTeam)
        
        let viewWholeTable = UIButton()
        viewWholeTable.setEqualSizeAndPlaceNextTo(object: thirdPlacedTeam)
        viewWholeTable.setTitle("●●●", for: .normal)
        viewWholeTable.titleLabel?.font = .systemFont(ofSize: 10.0)
        viewWholeTable.addTarget(self, action: #selector(displayStandingsTableView), for: .touchUpInside)
        view.addSubview(viewWholeTable)
                
        var premierLeagueTable = [Team]() {
            didSet {
                DispatchQueue.main.async {
                    print("Data received.")
                    
                    firstPlacedTeam.displayCrest(ofTeam: premierLeagueTable[0].team.id)
                    firstPlacedTeam.displayAmountOfPoints(fromSource: premierLeagueTable[0].points)
                    
                    secondPlacedTeam.displayCrest(ofTeam: premierLeagueTable[1].team.id)
                    secondPlacedTeam.displayAmountOfPoints(fromSource: premierLeagueTable[1].points)
                    
                    thirdPlacedTeam.displayCrest(ofTeam: premierLeagueTable[2].team.id)
                    thirdPlacedTeam.displayAmountOfPoints(fromSource: premierLeagueTable[2].points)
                    
                    print("Data displayed.")
                }
            }
        }
        
        let premierLeague = CreateRequest(fromAdress: premierLeagueTableDataAdress)
        
        premierLeague.getStandingsData { result in
            switch result {
            case .failure(let receivedError):
                print(receivedError)
            case .success(let receivedData):
                premierLeagueTable = receivedData
            }
        }
    }
    //outside viewDidLoad()
    
}







