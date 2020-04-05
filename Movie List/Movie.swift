//
//  Movie.swift
//  Movie List
//
//  Created by Ahava on 4/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class Movie {
    var name: String
    var seenOrNot: Bool = false
    
    init(name: String, seenOrNot: Bool) {
        self.name = name
        self.seenOrNot = seenOrNot
    }
    
    init(name: String) {
        self.name = name
    }
}
