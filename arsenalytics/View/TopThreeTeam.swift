//
//  TopBarObject.swift
//  arsenalytics
//
//  Created by Kacper Jagiello on 04/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setEqualSizeAndPlaceNextTo(object: UIButton) {
        self.frame = CGRect(x: object.frame.maxX, y: object.frame.minY, width: object.frame.size.width, height: object.frame.size.height)
    }
    
    func displayCrest(ofTeam id: Int) {
        self.setImage(UIImage(named: String(id)), for: .normal)
    }
    
    func displayImageFrom(urlAdress: String) {
        let imageAdress = URL(string: urlAdress)
        let receivedImageData = try? Data(contentsOf: imageAdress!)
        self.setImage(UIImage(data: receivedImageData!), for: .normal)
    }
}
