//  Created by Kacper Jagiello on 04/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit
import WebKit

class PremierLeagueWebsiteViewController: UIViewController, WKNavigationDelegate {

    private var websiteView: WKWebView!
    private let adress: String = "https://www.premierleague.com"
    
    override func loadView() {
        websiteView = WKWebView()
        websiteView.navigationDelegate = self
        view = websiteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlAdress = URL(string: adress)!
        websiteView.load(URLRequest(url: urlAdress))
    }
}
