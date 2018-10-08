//
//  CharactersTableViewController.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 6/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    
    var characterList: CharacterList? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var urlSession: URLSession!
    
    override func viewWillAppear(_ animated: Bool) {
        readCharacterList()
        
        super.viewWillAppear(animated)
        
        let configuration = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.urlSession.invalidateAndCancel()
        self.urlSession = nil
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterList?.characters.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterItemTableViewCell", for: indexPath) as! CharacterItemTableViewCell
        
        let character = self.characterList!.characters[indexPath.row]
        cell.characterName.text = character.name
        
        let request = URLRequest(url: character.imageURL)
        
        cell.dataTask = self.urlSession.dataTask(with: request) { (data, response, error) -> Void in
            OperationQueue.main.addOperation({ () -> Void in
                if error == nil && data != nil {
                    let image = UIImage(data: data!)
                    cell.characterImageView.image = image
                }
            })
        }
        
        cell.dataTask?.resume()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? CharacterItemTableViewCell {
            cell.dataTask?.cancel()
        }
        
    }
    
    func readCharacterList() {
        let path = Helpers.characterListPath()
        let unarchivedObject = NSKeyedUnarchiver.unarchiveObject(withFile: path)
        characterList = unarchivedObject as? CharacterList
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacterDetails" {
            let indexPath = self.tableView.indexPathForSelectedRow!

            let destination = segue.destination as! CharacterDetailsViewController
            
            let character = self.characterList!.characters[indexPath.row]

            destination.character = character
        }
        
    }
}
