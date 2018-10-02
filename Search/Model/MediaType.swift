//
//  MediaType.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

struct MediaType{
    var entityname: String
    var isSelected: Bool
    
    init(entityname: String) {
        self.entityname = entityname
        self.isSelected = false
    }
    
    static func getEntities() -> [MediaType]{
        return [MediaType(entityname: "Album"),
                MediaType(entityname: "Artist"),
                MediaType(entityname: "Book"),
                MediaType(entityname: "Movie"),
                MediaType(entityname: "Music Video"),
                MediaType(entityname: "Pod Cast"),
                MediaType(entityname: "Song")]
        
    }
}
