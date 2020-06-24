//  Created by Kacper on 05/03/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation
import UIKit

final class PodiumButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createPodiumButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createPodiumButton()
    }
    
    fileprivate func createPodiumButton() {
        backgroundColor = .clear
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        setTitleColor(ColorPalette.darkNavy, for: .normal)
    }
    
}

extension PodiumButton {
    func displayCrest(ofTeam id: Int) {
        setBackgroundImage(UIImage(named: String(id)), for: .normal)
    }

    func displayAmountOfPoints(fromSource points: Int) {
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -90.0, right: 0)
        titleEdgeInsets = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        setTitle(String(points), for: .normal)
    }
}
