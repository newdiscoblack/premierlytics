//  Created by Kacper Jagiello on 04/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit
import WebKit

class PremierLeagueWebsiteViewController: UIViewController, WKNavigationDelegate {

    private var websiteView: WKWebView!
    
    override func loadView() {
        websiteView = WKWebView()
        websiteView.navigationDelegate = self
        view = websiteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.premierleague.com")!
        websiteView.load(URLRequest(url: url))
    }
}
