//  Created by Kacper Jagiello on 04/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit
import WebKit

final class PremierLeagueWebsiteViewController: UIViewController, WKNavigationDelegate {

    fileprivate var websiteView: WKWebView!

    override func loadView() {
        super.loadView()
        
        websiteView = WKWebView()
        websiteView.navigationDelegate = self
        view = websiteView
        
        print("Premier League Website View being presented.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let premierLeagueWebsiteAdress: String = AdressBook.premierLeagueWebsite
        let urlOfPremierLeagueWebsite = URL(string: premierLeagueWebsiteAdress)!
        websiteView.load(URLRequest(url: urlOfPremierLeagueWebsite))
    }
    
    deinit {
        print("Premier League Website View deinitialized.")
    }
}
