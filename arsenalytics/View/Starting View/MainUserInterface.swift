//  Created by Kacper Jagiello on 14/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit
import Foundation

final class MainUserInterface: UIView {
    // MARK: UI elements
    private let topThreeTeamsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.frame = CGRect()
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    let premierLeagueLogo: UIButton = {
        let button = UIButton()
        button.frame = CGRect()
        button.setImage(UIImage(named: "premierLeagueLogo"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    var firstPlacedTeam = PodiumButton()
    var secondPlacedTeam = PodiumButton()
    var thirdPlacedTeam = PodiumButton()

    let viewWholeTable: UIButton = {
        let button = UIButton()
        button.frame = CGRect()
        button.setTitle("●●●", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(ColorPalette.mainColor, for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 10.0)
        return button
    }()
    
    let matchweekNavigation: UIStackView = {
        let stackView = UIStackView()
        stackView.frame = CGRect()
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()

    private let matchweekLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 35.0)
        label.textColor = ColorPalette.supportingColor
        label.backgroundColor = ColorPalette.fadedNavy
        label.textAlignment = .left
        label.text = "Matchweek"
        return label
    }()
    
    let previousMatchweek: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.backgroundColor = ColorPalette.fadedNavy
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35.0)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(ColorPalette.mainColor, for: .highlighted)
        button.setTitle("-", for: .normal)
        return button
    }()
    
    private let currentMatchweek: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.backgroundColor = ColorPalette.fadedNavy
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35.0)
        button.setTitleColor(ColorPalette.supportingColor, for: .normal)
        return button
    }()
    
    let nextMatchweek: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.backgroundColor = ColorPalette.fadedNavy
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35.0)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(ColorPalette.mainColor, for: .highlighted)
        button.setTitle("+", for: .normal)
        return button
    }()

    let currentFixtures: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect()
        tableView.backgroundColor = ColorPalette.fadedNavy
        tableView.separatorColor = .clear
        return tableView
    }()
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementsToTheView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addElementsToTheView()
        setupLayout()
    }
    
    // MARK: UI setup
    fileprivate func addElementsToTheView() {
        backgroundColor = ColorPalette.supportingColor

        let topThreeUserInterfaceElements = [premierLeagueLogo, firstPlacedTeam, secondPlacedTeam, thirdPlacedTeam, viewWholeTable]
        let matchweekUserInterfaceElements = [matchweekLabel, previousMatchweek, currentMatchweek, nextMatchweek]
        
        addSubview(topThreeTeamsStackView)
        for element in topThreeUserInterfaceElements {
            topThreeTeamsStackView.addArrangedSubview(element)
        }
        
        addSubview(matchweekNavigation)
        for element in matchweekUserInterfaceElements {
            matchweekNavigation.addArrangedSubview(element)
        }
        
        addSubview(currentFixtures)
    }
    
    fileprivate func setupLayout() {
        topThreeTeamsStackView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: Dimensions.screenWidth, height: CGFloat(Dimensions.topBarElementHeight), enableInsets: false)
        
        matchweekNavigation.anchor(top: topThreeTeamsStackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: Dimensions.screenHeight/10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: Dimensions.screenWidth, height: 50, enableInsets: false)
        
        currentFixtures.anchor(top: matchweekNavigation.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: Dimensions.screenWidth, height: 0, enableInsets: false)
    }
}

// MARK: display data
extension MainUserInterface {
    func updateTopThree(teams: [Team]) {
        firstPlacedTeam.displayCrest(ofTeam: teams[0].team.id)
        firstPlacedTeam.displayAmountOfPoints(fromSource: teams[0].points)
        
        secondPlacedTeam.displayCrest(ofTeam: teams[1].team.id)
        secondPlacedTeam.displayAmountOfPoints(fromSource: teams[1].points)
        
        thirdPlacedTeam.displayCrest(ofTeam: teams[2].team.id)
        thirdPlacedTeam.displayAmountOfPoints(fromSource: teams[2].points)
    }
    
    func currentlyDisplaying(matchweek: Int) {
        currentMatchweek.setTitle("\(matchweek)", for: .normal)
    }
}

