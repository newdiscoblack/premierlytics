//  Created by Kacper Jagiello on 01/02/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation
import UIKit

struct Dimensions {
    static let screenHeight = UIScreen.main.bounds.height
    static let screenWidth = UIScreen.main.bounds.width
    static let numberOfTopBarElements = 5
    static let topBarElementWidth = Int(Dimensions.screenWidth)/numberOfTopBarElements
    static let topBarElementHeight = Int(Dimensions.screenWidth)/numberOfTopBarElements
}
