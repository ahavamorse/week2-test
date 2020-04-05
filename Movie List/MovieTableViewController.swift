//
//  MovieTableViewController.swift
//  Movie List
//
//  Created by Ahava on 4/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = [Movie(name: "Hello World", seenOrNot: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "AddMovieSegue" {
            if let viewController = segue.destination as? AddMovieViewController {
                viewController.delegate = self
            }
        } else if segue.identifier == "ChangeMovieNameSegue" {
            if let viewController = segue.destination as? ChangeMovieNameViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                viewController.delegate = self
                viewController.cellNumber = tableView.indexPathForSelectedRow?.row
            }
        }
    }
    

}

extension MovieTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {
            fatalError("Not a MovieTableViewCell")
        }
        
        cell.movie = movies[indexPath.row]
        
        return cell
    }
    
    
}

extension MovieTableViewController: AddMovieDelegate {
    func addMovie(movie: Movie) {
        movies.append(movie)
        navigationController?.popViewController(animated: true)
        tableView.reloadData()
    }
}

extension MovieTableViewController: ChangeMovieNameDelegate {
    func changeName(cellNum: Int, newName: String) {
        let index = cellNum
        movies[index].name = newName
        
//        cell.movie?.name = newName
        navigationController?.popViewController(animated: true)
        tableView.reloadData()
    }
    
    
}
