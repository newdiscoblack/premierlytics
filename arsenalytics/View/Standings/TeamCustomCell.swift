//  Created by Kacper Jagiello on 09/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation
import UIKit

final class TeamCustomCell: UITableViewCell {
    var team: Team? {
        didSet {
            displayPlaceInTheTable()
            displayTeamcrestAndName()
            displaySeasonStatistics()
        }
    }
    // MARK: UI elements
    private let placeInTheTable: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .center
        return label
    }()
    
    private let teamCrestView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .left
        return label
    }()
    
    private let gamesWon = TeamStatsLabel()
    private let gamesDrawn = TeamStatsLabel()
    private let gamesLost = TeamStatsLabel()
    private let goalsScored = TeamStatsLabel()
    private let goalsConceded = TeamStatsLabel()
    private let goalDifference = TeamStatsLabel()
    
    private let amountOfPoints: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24.0)
        label.textAlignment = .right
        return label
    }()
    
    private let teamStatsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 5
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

extension TeamCustomCell {
    // MARK: UI setup
    fileprivate func addElementsToTheView() {
        let standaloneElements = [placeInTheTable, teamCrestView, teamNameLabel, amountOfPoints]
        for element in standaloneElements {
            addSubview(element)
        }
        
        let teamStatsStackViewElements = [gamesWon, gamesDrawn, gamesLost, goalsScored, goalsConceded, goalDifference]
        for element in teamStatsStackViewElements {
            teamStatsStackView.addArrangedSubview(element)
        }
        addSubview(teamStatsStackView)
    }
    
    fileprivate func setupLayout() {
        placeInTheTable.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        
        teamCrestView.anchor(top: topAnchor, left: placeInTheTable.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width/5, height: 0, enableInsets: false)
        
        teamNameLabel.anchor(top: topAnchor, left: teamCrestView.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)

        amountOfPoints.anchor(top: teamNameLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        
        teamStatsStackView.anchor(top: teamNameLabel.bottomAnchor, left: teamNameLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    //MARK: methods displaying data
    fileprivate func displayPlaceInTheTable() {
        placeInTheTable.text = String(team?.position ?? 0)
    }
    
    fileprivate func displayTeamcrestAndName() {
        let selectedTeam = team?.team
        
        teamCrestView.image = {
            let teamCrestImageName: String?
            if selectedTeam?.id != nil {
                teamCrestImageName = String(selectedTeam!.id)
            } else {
                teamCrestImageName = String(001)
            }
            return UIImage(named: teamCrestImageName!)
        }()
        
        let teamnameFormatter = TeamnameFormatter()
        teamNameLabel.text = teamnameFormatter.displayTeamname(of: selectedTeam?.name ?? "")
    }
    
    fileprivate func displaySeasonStatistics() {
        gamesWon.text = "Won:\n\(team?.won ?? 0)"
        gamesDrawn.text = "Drawn:\n\(team?.draw ?? 0)"
        gamesLost.text = "Lost:\n\(team?.lost ?? 0)"
        goalsScored.text = "⚽️➕\n\(team?.goalsFor ?? 0)"
        goalsConceded.text = "⚽️➖\n\(team?.goalsAgainst ?? 0)"
        goalDifference.text = "⚽️➗\n\(team?.goalDifference ?? 0)"
        amountOfPoints.text = {
            let acumulatedPoints = team?.points ?? 0
            return String(acumulatedPoints)
        }()
    }
}
