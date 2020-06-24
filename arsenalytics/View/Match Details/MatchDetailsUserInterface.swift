//  Created by Kacper Jagiello on 02/02/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

final class MatchDetailsUserInterface: UIView {
    // MARK: UI elements
    private var stadium: UIStackView = {
        let stackView = UIStackView()
        stackView.frame = CGRect()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private var stadiumView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var stadiumClubCrest: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var stadiumName: UILabel = {
        let label = UILabel()
        label.frame = CGRect()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        label.backgroundColor = ColorPalette.supportingColor
        label.textColor = ColorPalette.mainColor
        label.textAlignment = .center
        return label
    }()

    private var fixture: UIStackView = {
        let stackView = UIStackView()
        stackView.frame = CGRect()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    private var homeTeam: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private var homeTeamCrest: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var homeTeamName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.contentMode = .scaleAspectFit
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private var homeTeamPosition: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var homeTeamPoints: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var gameResult: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private var awayTeam: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private var awayTeamCrest: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var awayTeamName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .scaleAspectFit
        label.numberOfLines = 0
        return label
    }()
    
    private var awayTeamPosition: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var awayTeamPoints: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var gametime: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        return label
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
}

extension MatchDetailsUserInterface {
    // MARK: UI setup
    fileprivate func addElementsToTheView() {
        let stadium = [stadiumView, stadiumClubCrest, stadiumName]
        let homeTeamDetails = [homeTeamCrest, homeTeamName, homeTeamPosition, homeTeamPoints]
        let awayTeamDetails = [awayTeamCrest, awayTeamName, awayTeamPosition, awayTeamPoints]
        let fixtureDetails = [homeTeam, gameResult, awayTeam]
        
        backgroundColor = .white

        for element in stadium {
            addSubview(element)
        }
        
        for element in homeTeamDetails {
            homeTeam.addArrangedSubview(element)
        }
        
        for element in awayTeamDetails {
            awayTeam.addArrangedSubview(element)
        }
        
        addSubview(fixture)
        for element in fixtureDetails {
            fixture.addArrangedSubview(element)
        }
        
        addSubview(gametime)
    }
    
    fileprivate func setupLayout() {
        stadiumView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: Dimensions.screenWidth, height: Dimensions.screenHeight/3, enableInsets: false)

        stadiumClubCrest.anchor(top: stadiumView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: Dimensions.screenWidth/3, height: 0, enableInsets: false)
        stadiumClubCrest.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        stadiumName.anchor(top: nil, left: nil, bottom: stadiumView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: Dimensions.screenWidth, height: 0, enableInsets: false)
        
        fixture.anchor(top: centerYAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: Dimensions.screenHeight/4, enableInsets: false)
        
        homeTeam.anchor(top: centerYAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        homeTeam.widthAnchor.constraint(equalToConstant: Dimensions.screenWidth/3).isActive = true
        
        awayTeam.anchor(top: centerYAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        awayTeam.widthAnchor.constraint(equalToConstant: Dimensions.screenWidth/3).isActive = true
        
        gameResult.anchor(top: centerYAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        gameResult.widthAnchor.constraint(equalToConstant: Dimensions.screenWidth/6).isActive = true
        gameResult.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        gametime.anchor(top: fixture.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: Dimensions.screenWidth, height: 100, enableInsets: false)
    }
    
    // MARK: display data
    func displayStadium(ofHomeTeam: Int) {
        stadiumView.image = UIImage(named: "stadium\(ofHomeTeam)")
        stadiumClubCrest.image = UIImage(named: "\(ofHomeTeam)")
        stadiumName.text = "\(StadiumNameObtainer.getName(teamIdentificator: ofHomeTeam))"
    }

    func displayTeamDetails(homeTeam: (id: Int, name: String, stats: (position: Int, points: Int)), awayTeam: (id: Int, name: String, stats: (position: Int, points: Int))) {
        
        let teamnameFormatter = TeamnameFormatter()
        homeTeamCrest.image = UIImage(named: String(homeTeam.0))
        homeTeamName.text = teamnameFormatter.displayTeamname(of: homeTeam.name)
        homeTeamPosition.text = "\(homeTeam.stats.position)."
        homeTeamPoints.text = "\(homeTeam.stats.points) pts"

        awayTeamCrest.image = UIImage(named: String(awayTeam.0))
        awayTeamName.text = teamnameFormatter.displayTeamname(of: awayTeam.name)
        awayTeamPosition.text = "\(awayTeam.2.0)."
        awayTeamPoints.text = "\(awayTeam.2.1) pts"
    }
    
    func displayMatchResult(matchDate: String?, matchStatus: String?, score: (homeTeam: Int, awayTeam: Int)?) {
        let matchday = DateObtainer(date: matchDate ?? "")
        switch matchStatus {
        case "SCHEDULED":
            gameResult.text = "\(matchday.displayGamedate())\n\(matchday.displayGametime())"
        case "FINISHED":
            if score?.homeTeam != nil && score?.awayTeam != nil {
                gameResult.text = "\(score!.homeTeam) - \(score!.awayTeam)"
                gametime.text = "Full Time"
            }
        case "POSTPONED":
            gameResult.text = "-"
            gameResult.textColor = .black
        default:
            if score?.homeTeam != nil && score?.awayTeam != nil {
                gameResult.text = "\(score!.homeTeam) - \(score!.awayTeam)"
            }
        }
    }
    
    func updateGameProgress(status: String?, gameStartedAt: String, lastStatusUpdate: String) {
        switch status {
        case "SCHEDULED":
            gametime.text = "Scheduled"
        case "POSTPONED":
            gametime.text = "Game postponed"
            gametime.textColor = .white
            gametime.backgroundColor = ColorPalette.postponedGame
        case "IN_PLAY":
            gametime.text = "\(displayGametime(started: gameStartedAt, updated: lastStatusUpdate)) min"
        case "PAUSED":
            gametime.text = "Half Time"
        case "FINISHED":
            gametime.text = "Full Time"
        default:
            gametime.text = ""
        }
    }
    
    fileprivate func displayGametime(started: String, updated: String) -> String {
        var realTimePassed: Int = 0
        var gametime: Int = 0
        
        let startHour = Int(started.split(separator: ":")[0]) ?? 0
        let startMinute = Int(started.split(separator: ":")[1]) ?? 0
        
        let updateHour = Int(updated.split(separator: ":")[0]) ?? 0
        let updateMinute = Int(updated.split(separator: ":")[1]) ?? 0
        
        if updateHour == startHour {
            realTimePassed += updateMinute - startMinute
        } else if updateHour - startHour == 1 {
            realTimePassed += (60 - startMinute) + updateMinute
        } else if updateHour - startHour == 2 {
            realTimePassed += (60 - startMinute) + 60 + updateMinute
        }

        switch realTimePassed {
        case 0...60:
            gametime = realTimePassed
        default:
            gametime = realTimePassed - 15
        }
        return String(gametime)
    }
}
