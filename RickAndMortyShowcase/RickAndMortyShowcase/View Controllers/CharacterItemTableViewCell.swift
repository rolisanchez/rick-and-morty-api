//
//  CharacterItemTableViewCell.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 8/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class CharacterItemTableViewCell: UITableViewCell {
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var characterName: UILabel!
    
    weak var dataTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
