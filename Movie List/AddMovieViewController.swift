//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by Ahava on 4/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol AddMovieDelegate {
    func addMovie(movie: Movie)
}

class AddMovieViewController: UIViewController {

    @IBOutlet weak var newMovieTextField: UITextField!
    
    
    var delegate: AddMovieDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addMovie(_ sender: UIButton) {
        if let name = newMovieTextField.text {
            delegate?.addMovie(movie: Movie(name: name))
        }
    }
}
