//
//  MovieDatabaseViewController.swift
//  MovieDBObjC
//
//  Created by Timothy Rosenvall on 7/5/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class MovieDatabaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TRNetworkController.fetchMovies("Finding Nemo") { (dictionary) in
        }
    }
    

}
