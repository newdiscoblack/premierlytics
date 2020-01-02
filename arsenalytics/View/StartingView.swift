//  Created by Kacper Jagiello on 28/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import UIKit

class StartingView: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        backgroundImage.image = UIImage(named: "premierLeagueBackground")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.addSubview(backgroundImage)
        
        let premierLeagueLogo = UIButton(frame: CGRect(x: 0, y: 50, width: screenWidth/4, height: screenWidth/4))
        premierLeagueLogo.setImage(UIImage(named: "premierLeagueLogo"), for: UIControl.State.normal)
        view.addSubview(premierLeagueLogo)
        
        let topThreeTeamsBackground = UIView(frame: CGRect(x: 0 + premierLeagueLogo.frame.width + 10, y: 50, width: screenWidth, height: premierLeagueLogo.frame.height))
        topThreeTeamsBackground.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0, alpha: 0.8491545377)
        view.addSubview(topThreeTeamsBackground)
        
        let crestWidthAndHeight = topThreeTeamsBackground.frame.width/3
        
        
    }

}

