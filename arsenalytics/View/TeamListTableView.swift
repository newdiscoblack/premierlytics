//  Created by Kacper Jagiello on 27/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import UIKit

class TeamListTableView: UITableViewController {
    
    private let resourceAdress: String = "https://api.football-data.org/v2/competitions/2021/teams"
    var teamList = [TeamDetails]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let resourceRequest = CreateRequest(fromAdress: resourceAdress)
        
        resourceRequest.getTeamData { [weak self] result in
            switch result {
            case .failure(let receivedError):
                print(receivedError)
            case .success(let receivedData):
                self?.teamList = receivedData
                print(self?.teamList ?? "Data received")
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teamCell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let team = teamList[indexPath.row]
        
        teamCell.textLabel?.text = team.name
        
        return teamCell
    }
}
