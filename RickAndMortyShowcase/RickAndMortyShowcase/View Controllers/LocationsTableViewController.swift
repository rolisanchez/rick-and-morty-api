//
//  LocationsTableViewController.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 6/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    var locationList: LocationList? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        readLocationList()
        
        super.viewWillAppear(animated)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locationList?.locations.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationItemTableViewCell", for: indexPath) as! LocationItemTableViewCell
        
        let location = self.locationList!.locations[indexPath.row]
        cell.locationName.text = location.name
        
        return cell
    }
    
    func readLocationList() {
        let path = Helpers.locationListPath()
        let unarchivedObject = NSKeyedUnarchiver.unarchiveObject(withFile: path)
        locationList = unarchivedObject as? LocationList
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLocationDetails" {
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            let destination = segue.destination as! LocationDetailsViewController
            
            let location = self.locationList!.locations[indexPath.row]
            
            destination.location = location
        }
        
    }
}

