//
//  EpisodeDetailsViewController.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 8/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {
    
    var episode: Episode?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    override func viewDidLoad() {
        nameLabel.text = episode?.name
        airDateLabel.text = episode?.airDate
        episodeLabel.text = episode?.episode
    }
}
