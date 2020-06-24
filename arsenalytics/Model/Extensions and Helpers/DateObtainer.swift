//  Created by Kacper Jagiello on 18/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation

final class DateObtainer {
    private let formatter = DateFormatter()
    private var obtainedDate: Date?

    init(date: String) {
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.locale = Locale(identifier: "pl_PL")
        obtainedDate = formatter.date(from: date)
        formatter.timeStyle = .short
        formatter.dateStyle = .short
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayGametime() -> String {
        guard obtainedDate != nil else { return "Error" }
        let numberOfDigits = Array(formatter.string(from: obtainedDate!)).count-1
        let matchStartsAt = String(Array(formatter.string(from: obtainedDate!))[numberOfDigits-4...numberOfDigits])
        return matchStartsAt
    }
    
    func displayGamedate() -> String {
        guard obtainedDate != nil else { return "Error" }
        let dateOfTheGame = String(Array(formatter.string(from: obtainedDate!))[0...4])
        return dateOfTheGame
    }
    
}
