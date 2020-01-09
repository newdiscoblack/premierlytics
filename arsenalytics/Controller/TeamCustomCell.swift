//  Created by Kacper Jagiello on 09/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation
import UIKit

class TeamCustomCell: UITableViewCell {
    
    var leagueTable : Team? {
        didSet {
            placeInTheTable.text = {
                let teamPositionInTheTable = self.leagueTable?.position ?? 0
                return String(teamPositionInTheTable)
            }()
            
            teamCrestView.image = {
                let teamCrestImageName: String?
                if self.leagueTable?.team.id != nil {
                    teamCrestImageName = String(self.leagueTable!.team.id)
                } else {
                    teamCrestImageName = "noImageAvailable"
                }
                return UIImage(named: teamCrestImageName!)
            }()
            
            teamNameLabel.text = {
                var teamName: String = ""
                switch self.leagueTable?.team.name {
                case "AFC Bournemouth":
                    teamName = self.leagueTable?.team.name ?? "Team name could not be received."
                default:
                    //Make it safer to unwrap.
                    teamName = String(Array((leagueTable?.team.name)!)[0...Array((leagueTable?.team.name)!).count-4])
                }
            return teamName
            }()

            gamesWonLabel.text = "Won:"
                
            numberOfGamesWon.text = {
                let gamesWon = self.leagueTable?.won ?? 0
                return String(gamesWon)
            }()
            
            gamesDrawnLabel.text = "Drawn:"
            
            numberOfGamesDrawn.text = {
                let gamesDrawn = self.leagueTable?.draw ?? 0
                return String(gamesDrawn)
            }()
            
            gamesLostLabel.text = "Lost:"
            
            numberOfGamesLost.text = {
                let gamesLost = self.leagueTable?.lost ?? 0
                return String(gamesLost)
            }()
            
            amountOfPoints.text = {
                let acumulatedPoints = self.leagueTable?.points ?? 0
                return String(acumulatedPoints)
            }()
        }
    }
    
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
    
    private let gamesWonLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textAlignment = .left
        return label
    }()
    
    private let numberOfGamesWon: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textAlignment = .left
        return label
    }()
    
    private let gamesDrawnLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textAlignment = .left
        return label
    }()
    
    private let numberOfGamesDrawn: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textAlignment = .left
        return label
    }()
    
    private let gamesLostLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textAlignment = .left
        return label
    }()
    
    private let numberOfGamesLost: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textAlignment = .left
        return label
    }()
    
    private let amountOfPoints: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24.0)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(placeInTheTable)
        addSubview(teamCrestView)
        addSubview(teamNameLabel)
        addSubview(gamesWonLabel)
        addSubview(numberOfGamesWon)
        addSubview(gamesDrawnLabel)
        addSubview(numberOfGamesDrawn)
        addSubview(gamesLostLabel)
        addSubview(numberOfGamesLost)
        addSubview(amountOfPoints)
        
        placeInTheTable.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        
        teamCrestView.anchor(top: topAnchor, left: placeInTheTable.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width/5, height: 0, enableInsets: false)
        
        teamNameLabel.anchor(top: topAnchor, left: teamCrestView.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        gamesWonLabel.anchor(top: teamNameLabel.bottomAnchor, left: teamCrestView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        numberOfGamesWon.anchor(top: gamesWonLabel.bottomAnchor, left: teamCrestView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        gamesDrawnLabel.anchor(top: teamNameLabel.bottomAnchor, left: gamesWonLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        numberOfGamesDrawn.anchor(top: gamesDrawnLabel.bottomAnchor, left: gamesDrawnLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        gamesLostLabel.anchor(top: teamNameLabel.bottomAnchor, left: gamesDrawnLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        numberOfGamesLost.anchor(top: gamesLostLabel.bottomAnchor, left: gamesLostLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        amountOfPoints.anchor(top: teamNameLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
}

extension UIView {

func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
   
   var topInset = CGFloat(0)
   var bottomInset = CGFloat(0)

if #available(iOS 11, *), enableInsets {
   let insets = self.safeAreaInsets
   topInset = insets.top
   bottomInset = insets.bottom

   print("Top: \(topInset)")
   print("Bottom: \(bottomInset)")
}

translatesAutoresizingMaskIntoConstraints = false

       if let top = top {
           self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
       }
       if let left = left {
           self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
       }
       if let right = right {
           rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
       }
       if let bottom = bottom {
           bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
       }
       if height != 0 {
           heightAnchor.constraint(equalToConstant: height).isActive = true
       }
       if width != 0 {
           widthAnchor.constraint(equalToConstant: width).isActive = true
       }
   }
}
