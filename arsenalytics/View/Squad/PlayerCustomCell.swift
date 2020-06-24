//  Created by Kacper Jagiello on 17/02/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

final class PlayerCustomCell: UITableViewCell {
    
    var player: Player? {
        didSet {
            displayPlayerIcon()
            displayPlayerDetails()
        }
    }

    //MARK: UI elements
    private var playerIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var playerDetails: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private var playerName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.frame = CGRect()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var playerPosition: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.frame = CGRect()
        return label
    }()
    
    private var playerNationality: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.frame = CGRect()
        return label
    }()
    
    //MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElementsToTheView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addElementsToTheView()
        setupLayout()
    }
    
}

extension PlayerCustomCell {
    //MARK: UI setup
    fileprivate func addElementsToTheView() {
        addSubview(playerIcon)
        addSubview(playerDetails)
        playerDetails.addArrangedSubview(playerName)
        playerDetails.addArrangedSubview(playerPosition)
        playerDetails.addArrangedSubview(playerNationality)
    }
    
    fileprivate func setupLayout() {
        playerIcon.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 0, enableInsets: false)
        playerDetails.anchor(top: topAnchor, left: playerIcon.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    //MARK: display data
    fileprivate func displayPlayerIcon() {
        let playerPosition: String = player?.position ?? ""
        var imageName: String = ""
        
        switch playerPosition {
        case "Goalkeeper":
            imageName = "goalkeeper"
        case "Defender":
            imageName = "defender"
        case "Midfielder":
            imageName = "midfielder"
        case "Attacker":
            imageName = "attacker"
        default:
            imageName = "coach"
        }
        
        playerIcon.image = UIImage(named: imageName)
    }

    fileprivate func displayPlayerDetails() {
        playerName.text = "\(player?.name ?? "")"
        playerNationality.text = "\(player?.nationality ?? "")"
        
        if self.player?.position != nil {
            playerPosition.text = "\(player?.position ?? "")"
        } else {
            playerPosition.text = "Coach"
        }
    }
}
