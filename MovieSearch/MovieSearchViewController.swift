//
//  MovieSearchViewController.swift
//  MovieSearch
//
//  Created by James Campagno on 2/14/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let movieAPI = MovieAPI()
    
    var movies: [Movie] = [] // we created
    
    @IBOutlet weak var tableView: UITableView! // we created
    
    @IBOutlet weak var searchTextField: UITextField! // we created
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }
    
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    } // we created
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! movieTableViewCell
        let movie = movies[indexPath.row]
        cell.movieNameLabel.text = movie.title
        cell.movieYearLabel.text = movie.year
        return cell
    } // we created
    
    
    
    func searchFilm(with title: String) {
        
        if let dictionary = movieAPI.searchFilm(title: title) {
            
            movies.removeAll()
            
            let searchResults = dictionary["Search"] as! [[String : Any]]
            
            for movieDictionary in searchResults {
                
                let newMovie = Movie(dictionary: movieDictionary)
                
                movies.append(newMovie)
            }
            
        }
        
        tableView.reloadData()
    }
} // we created

// MARK: - UITextFieldDelegate
extension MovieSearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let title = textField.text ?? "No Text"
        searchFilm(with: title)
        textField.resignFirstResponder()
        return true
    }
}

