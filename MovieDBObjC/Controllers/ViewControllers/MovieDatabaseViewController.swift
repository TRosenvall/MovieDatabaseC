//
//  MovieDatabaseViewController.swift
//  MovieDBObjC
//
//  Created by Timothy Rosenvall on 7/5/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

// **The bridging header file is in the resources folder.**

import UIKit

class MovieDatabaseViewController: UIViewController {

    // Source of Truth, reloads the table when accessed.
    var movies: [TRMovie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // IBOutlets for the table view and the search bar.
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
}

// Setting the view controller as the search bar delegate.
extension MovieDatabaseViewController: UISearchBarDelegate {
    // Fetches movies as the search bar text changes.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Run the api call.
        TRNetworkController.fetchMovies(searchText) { (movies) in
            // Set the source of truth to the result of the api call.
            guard let unwrappedMovies = movies else {return}
            self.movies = unwrappedMovies as! [TRMovie]
        }
    }
}

extension MovieDatabaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Setup the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cast the cell as our custom movies table view controller.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        // Pull each movie out of the movies array.
        let movie = self.movies[indexPath.row]
        // Unrwapping the movie rating.
        guard let rating = movie.rating else {return UITableViewCell()}
        // Set cell properties.
        cell.titleLabel.text = movie.title
        cell.ratingLabel.text = "Rating: \(rating)"
        cell.overviewLabel.text = movie.overview
        return cell
    }
}

