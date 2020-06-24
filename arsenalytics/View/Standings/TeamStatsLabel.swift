//  Created by Kacper Jagiello on 12/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation
import UIKit

final class TeamStatsLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        createLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createLabel()
    }
    
    fileprivate func createLabel() {
        textColor = .gray
        font = UIFont.systemFont(ofSize: 10.0)
        textAlignment = .left
        numberOfLines = 2
    }
}
