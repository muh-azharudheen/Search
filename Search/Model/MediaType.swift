//
//  MediaType.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

struct MediaType{
    var entity: Entity
    var isSelected: Bool

    init(entity: Entity) {
        self.entity = entity
        self.isSelected = false
    }

    static func getEntities() -> [MediaType]{
        return [MediaType(entity: .album),
                MediaType(entity: .artist),
                MediaType(entity: .book),
                MediaType(entity: .movie),
                MediaType(entity: .musicVideo),
                MediaType(entity: .podcast),
                MediaType(entity: .song)]
    }
}


