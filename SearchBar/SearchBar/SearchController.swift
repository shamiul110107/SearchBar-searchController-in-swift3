//
//  SearchController.swift
//  SearchBar
//
//  Created by MobioApp on 6/11/17.
//  Copyright © 2017 MobioApp. All rights reserved.
//

import UIKit

class SearchController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let unfilteredTeams = ["Bengals", "Ravens", "Browns", "Steelers", "Bears", "Lions", "Packers", "Vikings",
                           "Texans", "Colts", "Jaguars", "Titans", "Falcons", "Panthers", "Saints", "Buccaneers",
                           "Bills", "Dolphins", "Patriots", "Jets", "Cowboys", "Giants", "Eagles", "Redskins",
                           "Broncos", "Chiefs", "Raiders", "Chargers", "Cardinals", "Rams", "49ers", "নামাজ", "কালাম", "রোজা", "সালাত"].sorted()
    
    var filteredTeams: [String]?
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredTeams = unfilteredTeams
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let nflTeams = filteredTeams else {
            return 0
        }
        return nflTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        if let nflTeams = filteredTeams {
            let team = nflTeams[indexPath.row]
            cell.textLabel!.text = team
        }
        
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredTeams = unfilteredTeams.filter { team in
                return team.lowercased().contains(searchText.lowercased())
            }
            
        } else {
            filteredTeams = unfilteredTeams
        }
        tableView.reloadData()
    }
    

}
