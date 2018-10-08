//
//  CharacterDetailsViewController.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 8/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    var character: Character?
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    var urlSession: URLSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = character?.name
        statusLabel.text = character?.status
        speciesLabel.text = character?.species
        typeLabel.text = character?.type
        genderLabel.text = character?.gender
        originLabel.text = character?.originName
        locationLabel.text = character?.locationName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: configuration)
        
        loadImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.urlSession.invalidateAndCancel()
        self.urlSession = nil
    }
    
    func loadImage() {
        let request = URLRequest(url: character!.imageURL)

        let dataTask = self.urlSession.dataTask(with: request) { (data, response, error) -> Void in
            OperationQueue.main.addOperation({ () -> Void in
                if error == nil && data != nil {
                    let image = UIImage(data: data!)
                    self.characterImage.image = image
                }
            })
        }
        
        dataTask.resume()
    }
    
    
}
