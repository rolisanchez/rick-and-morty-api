//
//  EpisodesTableViewController.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 6/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
    var episodeList: EpisodeList? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        readEpisodeList()
        
        super.viewWillAppear(animated)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episodeList?.episodes.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeItemTableViewCell", for: indexPath) as! EpisodeItemTableViewCell
        
        let episode = self.episodeList!.episodes[indexPath.row]
        cell.episodeName.text = episode.name
        
        return cell
    }
    
    func readEpisodeList() {
        let path = Helpers.episodeListPath()
        let unarchivedObject = NSKeyedUnarchiver.unarchiveObject(withFile: path)
        episodeList = unarchivedObject as? EpisodeList
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue")
        if segue.identifier == "showEpisodeDetails" {
            print("segue2222")
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            let destination = segue.destination as! EpisodeDetailsViewController
            
            let episode = self.episodeList!.episodes[indexPath.row]
            
            destination.episode = episode
        }
        
    }
}

