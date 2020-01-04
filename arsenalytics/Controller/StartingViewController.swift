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
        self.setBackgroundImage(UIImage(named: String(id)), for: .normal)
    }
    
    func displayAmountOfPoints(fromSource points: Int) {
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -90.0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        self.setTitle(String(points), for: .normal)
    }
    
    func displayImageFrom(urlAdress: String) {
        let imageAdress = URL(string: urlAdress)
        let receivedImageData = try? Data(contentsOf: imageAdress!)
        self.setImage(UIImage(data: receivedImageData!), for: .normal)
    }
}
