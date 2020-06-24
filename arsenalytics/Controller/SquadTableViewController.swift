//  Created by Kacper Jagiello on 17/02/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

final class SquadTableViewController: UITableViewController {
    //MARK: variables
    private var teamName: String?
    
    private var squad = [Player]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    var selectedTeamIdentificator: Int? {
        didSet {
            let squadDetailsDataAdress: String = AdressBook.teamDetails
            let squadDataAdress = "\(squadDetailsDataAdress)\(selectedTeamIdentificator!)"
            let squadDataRequest = CreateRequest(fromAdress: squadDataAdress)
            
            squadDataRequest.getData(ofType: TeamDetails.self) { [weak self] (receivedData, error) in
                guard error == nil else {
                    print("Couldn't receive selected squad data.")
                    return
                }
                self?.teamName = receivedData?.name
                self?.squad = receivedData?.squad ?? []
                
                print("List of players and coaches from \(self?.teamName ?? "") is being displayed.")
            }
        }
    }
    //MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PlayerCustomCell.self, forCellReuseIdentifier: "playerCustomCell")  
    }
    
    deinit {
        print("Squad view deinitialized.")
    }
}

extension SquadTableViewController {
    //MARK: UITableViewDataSource
    internal override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return squad.count
    }
    
    internal override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playerCell = tableView.dequeueReusableCell(withIdentifier: "playerCustomCell", for: indexPath) as! PlayerCustomCell
        playerCell.backgroundColor = .white
        playerCell.selectionStyle = .none
        playerCell.player = squad[indexPath.row]
        return playerCell
    }

    //MARK: UITableViewDelegate
    internal override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
