//
//  ChangeMovieNameViewController.swift
//  Movie List
//
//  Created by Ahava on 4/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol ChangeMovieNameDelegate {
    func changeName(cellNum: Int, newName: String)
}

class ChangeMovieNameViewController: UIViewController {
    
    @IBOutlet weak var newNameTextField: UITextField!
    
    
    
    var delegate: ChangeMovieNameDelegate?
    var cellNumber: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveNewName(_ sender: UIButton) {
        if let newName = newNameTextField.text,
            let cellNum = cellNumber {
            delegate?.changeName(cellNum: cellNum, newName: newName)
        }
    }
    
}

