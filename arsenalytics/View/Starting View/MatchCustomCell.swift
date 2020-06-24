//  Created by Kacper Jagiello on 12/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation
import UIKit

final class MatchCustomCell: UITableViewCell {
    var match: Match? {
        didSet {
            displayTeamDetails()
            displayGameResult()
        }
    }

    // MARK: cell elements
    private let homeTeamShortName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    private let homeTeamCrest: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let gameResult: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textAlignment = .center
        return label
    }()
    
    private let awayTeamCrest: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let awayTeamShortName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let resultStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 1
        return stackView
    }()
    
    // MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElementsToTheView()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addElementsToTheView()
        setupLayout()
    }
}

//MARK: additional methods
extension MatchCustomCell {
    fileprivate func addElementsToTheView() {
        let resultStackViewSubviews = [homeTeamShortName, homeTeamCrest, gameResult, awayTeamCrest, awayTeamShortName]
        for element in resultStackViewSubviews {
            resultStackView.addArrangedSubview(element)
        }
        addSubview(resultStackView)
    }
    
    fileprivate func setupLayout() {
        resultStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    fileprivate func displayTeamDetails() {
        let homeTeamName = match?.homeTeam.name ?? "HOME"
        let homeTeamIdentificator = match?.homeTeam.id ?? 001
        
        let awayTeamName = match?.awayTeam.name ?? "AWAY"
        let awayTeamIdentificator = match?.awayTeam.id ?? 001
        
        let teamnameFormatter = TeamnameFormatter()
        
        homeTeamShortName.text = teamnameFormatter.displayThreeLetterTeamname(of: homeTeamName)
        homeTeamCrest.image = UIImage(named: String(homeTeamIdentificator))
        
        awayTeamShortName.text = teamnameFormatter.displayThreeLetterTeamname(of: awayTeamName)
        awayTeamCrest.image = UIImage(named: String(awayTeamIdentificator))
    }
    
    fileprivate func displayGameResult() {
        let goalsScoredBy = match?.score.fullTime
        let dateObtainer = DateObtainer(date: match?.utcDate ?? "??")
        let currentScore = "\(goalsScoredBy?.homeTeam ?? 0) - \(goalsScoredBy?.awayTeam ?? 0)"
        let plannedDate = "🗓\(dateObtainer.displayGamedate())\n🕝\(dateObtainer.displayGametime())"
        
        switch match?.status {
        case "SCHEDULED":
            gameResult.backgroundColor = ColorPalette.scheduledGame
            gameResult.font = UIFont.systemFont(ofSize: 12.0)
            gameResult.textAlignment = .center
            gameResult.textColor = .white
            gameResult.text = plannedDate
        case "FINISHED":
            gameResult.backgroundColor = ColorPalette.finishedGame
            gameResult.textColor = .white
            gameResult.font = UIFont.boldSystemFont(ofSize: 14.0)
            gameResult.text = currentScore
        case "POSTPONED":
            gameResult.backgroundColor = ColorPalette.postponedGame
            gameResult.textColor = ColorPalette.mainColor
            gameResult.text = "POST\nPONED"
        case "PAUSED":
            gameResult.backgroundColor = ColorPalette.gameBeingPlayed
            gameResult.textColor = .white
            gameResult.text = "\(currentScore)\nHT"
        default:
            gameResult.backgroundColor = ColorPalette.gameBeingPlayed
            gameResult.textColor = .white
            gameResult.text = "\(currentScore)\n⚽️"
        }
    }
}
