//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Ahava on 4/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieSeenButton: UIButton!
    
    var movie: Movie? {
        didSet {
            updateVeiw()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func updateVeiw() {
        if let name = movie?.name,
            let seenOrNot = movie?.seenOrNot {
            movieNameLabel.text = name
            
            if seenOrNot {
                movieSeenButton.setTitle("Seen", for: .normal)
            } else {
                movieSeenButton.setTitle("Not Seen", for: .normal)
            }
            
        }
    }
    
    @IBAction func changeSeenOrNot(_ sender: Any) {
        if let movie = movie {
            if movie.seenOrNot {
                movie.seenOrNot = false
                updateVeiw()
            } else {
                movie.seenOrNot = true
                updateVeiw()
            }
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
