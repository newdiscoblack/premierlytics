//  Created by Kacper Jagiello on 28/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import UIKit

class StartingView: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    private let premierLeagueTableDataAdress: String = "https://api.football-data.org/v2/competitions/2021/standings"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        let topBarElementsCount = 4
        let topBarItemSize = Int(screenWidth)/topBarElementsCount
        
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        backgroundImage.image = UIImage(named: "premierLeagueBackground")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.addSubview(backgroundImage)
        
        let premierLeagueLogo = UIButton(frame: CGRect(x: 0, y: 50, width: topBarItemSize, height: topBarItemSize))
        premierLeagueLogo.setImage(UIImage(named: "premierLeagueLogo"), for: UIControl.State.normal)
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
        
        var premierLeagueTable = [Team]() {
            didSet {
                DispatchQueue.main.async {
                    print("Data received")
                    firstPlacedTeam.displayCrest(ofTeam: premierLeagueTable[0].team.id)
                    secondPlacedTeam.displayCrest(ofTeam: premierLeagueTable[1].team.id)
                    thirdPlacedTeam.displayCrest(ofTeam: premierLeagueTable[2].team.id)
                    print("Crests displayed")
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
}






