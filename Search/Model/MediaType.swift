//
//  MediaType.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

enum Entity{
    case album, artist , book, movie, musicVideo, podcast , song
    
    var title: String{
        switch self {
        case .album: return "Album"
        case .artist: return "Artist"
        case .book: return "Book"
        case .movie: return "Movie"
        case .musicVideo: return "Music Video"
        case .podcast: return "Pod Cast"
        case .song: return "song"
        }
    }
    
    var entityName: String{
        switch self {
        case .album: return "album"
        case .artist: return "musicArtist"
        case .book: return "ebook"
        case .movie: return "movie"
        case .musicVideo: return "musicVideo"
        case .podcast: return "podcast"
        case .song: return "song"
        }
    }
        
        
    
}

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


