//  Created by Kacper Jagiello on 29/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import UIKit

class PlayerListTableView: UITableViewController {

    private let resourceAdress: String = "https://api.football-data.org/v2/teams/57"
    private var squad = [Player]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let resourceRequest = CreateRequest(fromAdress: resourceAdress)
        
        resourceRequest.getSquadData { [weak self] result in
            switch result {
            case .failure(let receivedError):
                print(receivedError)
            case .success(let receivedData):
                self?.squad = receivedData.squad
                print(self?.squad ?? "Data received")
            }
        }
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return squad.count
    }
}
