//  Created by Kacper Jagiello on 01/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

class StandingsTableView: UITableViewController {
    
    private let premierLeagueTableDataAdress: String = "https://api.football-data.org/v2/competitions/2021/standings"
    var premierLeagueTable = [Team]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startObservingDeviceOrientation()
        
        let premierLeague = CreateRequest(fromAdress: premierLeagueTableDataAdress)
        
        premierLeague.getStandingsData { [weak self] result in
            switch result {
            case .failure(let receivedError):
                print(receivedError)
            case .success(let receivedData):
                self?.premierLeagueTable = receivedData
            }
        }
    }
    
    func startObservingDeviceOrientation() {
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        
        NotificationCenter.default.addObserver(self,
        selector: #selector(orientationChanged(notification:)),
        name: UIDevice.orientationDidChangeNotification,
        object: nil)
    }

    @objc func orientationChanged(notification: NSNotification) {
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return premierLeagueTable.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teamInTheTable = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let leagueTable = premierLeagueTable[indexPath.row]
        
        showLessSeasonDetailsInPortraitMode(of: teamInTheTable, fromDataSource: leagueTable)
        showMoreSeasonDetailsInLandscapeMode(of: teamInTheTable, fromDataSource: leagueTable)
        
        return teamInTheTable
    }
    
    func showLessSeasonDetailsInPortraitMode(of cell: UITableViewCell, fromDataSource source: Team) {
        cell.textLabel?.text = "\(source.position). " + source.team.name
        cell.detailTextLabel?.text = "\(source.points) pts"
    }
    
    func showMoreSeasonDetailsInLandscapeMode(of cell: UITableViewCell, fromDataSource source: Team) {
        if UIDevice.current.orientation.isLandscape {
            cell.textLabel?.text = "\(source.position). " + source.team.name
            cell.detailTextLabel?.text = "\(source.points) pts W: \(source.won) D: \(source.draw) L: \(source.lost)"
        }
    }
}