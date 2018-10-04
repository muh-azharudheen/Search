//
//  SearchResult.swift
//  Search
//
//  Created by Mac on 10/4/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

struct SearchResult {
    
    private var type: Entity
    var title : String{
        return type.title
    }
    var data : [Media]
    
    init(entity: Entity, dict: [[String: AnyObject]]) {
        self.type = entity
        data = []
        for obj in dict{
            switch type{
            case .album:
                data.append(Media(albumDict: obj))
            case .artist:
                data.append(Media(artistDict: obj))
            case .book:
                data.append(Media(bookDict: obj))
            case .movie:
                data.append(Media(movieDict: obj))
            case .musicVideo:
                data.append(Media(musicVideoDict: obj))
            case .podcast:
                data.append(Media(podCastDict: obj))
            case .song:
                data.append(Media(songDict: obj))
            }
        }
        
    }
    
}
