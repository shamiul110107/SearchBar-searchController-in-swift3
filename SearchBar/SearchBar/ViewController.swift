//
//  ViewController.swift
//  SearchBar
//
//  Created by MobioApp on 5/20/17.
//  Copyright © 2017 MobioApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource ,UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchController: UISearchBar!
    
    var countryList = ["India","Bangladesh","Austrilia","NewZeland","Pakistan","Bhutan","Dubai","USA","England","Malayasia","Italy","Ireland","WestIndies","Zimbabwe","Colombia","Brazil","Argentina","RealMadrid"].sorted()
    
    var filterArray : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterArray = countryList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.filterArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let value = self.filterArray {
            cell.textLabel?.text = value[indexPath.row]
        }
        
        return cell

  }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText.isEmpty {
            filterArray = countryList
        } else {
            self.filterArray = countryList.filter({ $0.lowercased().contains(searchText.lowercased())
                
            })
        }
        
        tableView.reloadData()
      
    }
}

