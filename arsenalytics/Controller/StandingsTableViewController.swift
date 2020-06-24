//  Created by Kacper Jagiello on 01/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

final class StandingsTableViewController: UITableViewController {
    //MARK: variables
    private var premierLeagueTable = [Team]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    //MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
        print("Premier League Table is being presented.")
    }
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TeamCustomCell.self, forCellReuseIdentifier: "teamCustomCell")
        
        let premierLeagueTableDataAdress: String = AdressBook.leagueTable
        let leagueTableRequest = CreateRequest(fromAdress: premierLeagueTableDataAdress)
        
        leagueTableRequest.getData(ofType: PremierLeague.self) { [weak self] (expectedData, error) in
            guard error == nil else {
                print("Cannot receive current Premier League table data.")
                return
            }
            
            self?.premierLeagueTable = expectedData?.standings[0].table ?? []
        }
    }

    deinit {
        print("Standings deinitialized.")
    }
}

extension StandingsTableViewController {
    //MARK: UITableViewDataSource
    internal override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    internal override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return premierLeagueTable.count
    }
    
    internal override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teamInTheTable = tableView.dequeueReusableCell(withIdentifier: "teamCustomCell", for: indexPath) as! TeamCustomCell
        teamInTheTable.backgroundColor = .white
        teamInTheTable.selectionStyle = .none
        teamInTheTable.team = premierLeagueTable[indexPath.row]

        return teamInTheTable
    }
    
    //MARK: UITableViewDelegate
    internal override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    internal override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let target = SquadTableViewController()
        let selectedTeam = premierLeagueTable[indexPath.row]
        let teamnameFormatter = TeamnameFormatter()
                
        target.selectedTeamIdentificator = selectedTeam.team.id
        target.title = teamnameFormatter.displayTeamname(of: selectedTeam.team.name)
        
        navigationController?.pushViewController(target, animated: true)
    }
    
    internal override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let selectedCell: TeamCustomCell = tableView.cellForRow(at: indexPath) as! TeamCustomCell
        selectedCell.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 128, alpha: 0.1)
    }
    
    internal override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let selectedCell: TeamCustomCell = tableView.cellForRow(at: indexPath) as! TeamCustomCell
        selectedCell.backgroundColor = .white
    }
}
