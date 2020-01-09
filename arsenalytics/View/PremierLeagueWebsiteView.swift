//  Created by Kacper Jagiello on 04/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit
import WebKit

class PremierLeagueWebsiteViewController: UIViewController, WKNavigationDelegate {

    fileprivate var websiteView: WKWebView!
    fileprivate let premierLeagueWebsiteAdress: String = "https://www.premierleague.com"
    
    override func loadView() {
        websiteView = WKWebView()
        websiteView.navigationDelegate = self
        view = websiteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlOfPremierLeagueWebsite = URL(string: premierLeagueWebsiteAdress)!
        websiteView.load(URLRequest(url: urlOfPremierLeagueWebsite))
    }
}
