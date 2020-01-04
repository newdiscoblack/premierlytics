//
//  StandingsTableViewController.swift
//  arsenalytics
//
//  Created by Kacper Jagiello on 04/01/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.
//

import Foundation
import UIKit

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
