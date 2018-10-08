//
//  LocationDetailsViewController.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 8/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class LocationDetailsViewController: UIViewController {
    
    var location: Location?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    
    override func viewDidLoad() {
        nameLabel.text = location?.name
        typeLabel.text = location?.type
        dimensionLabel.text = location?.dimension
    }
}
