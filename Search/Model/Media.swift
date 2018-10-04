//
//  SearchResult.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class Media {
    var title: String
    var subTitle: String
    var imageURL : String?
    var previewURL : String?
    var itunesLink: String?
    
    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
    
    init(albumDict: [String: AnyObject]) {
        self.title = albumDict["collectionName"] as! String
        self.subTitle = albumDict["collectionCensoredName"] as! String
        self.imageURL = albumDict["artworkUrl100"] as? String
        self.itunesLink = albumDict["collectionViewUrl"] as? String
    }
    
    init(artistDict: [String: AnyObject]) {
        self.title = artistDict["artistName"] as! String
        self.subTitle = artistDict["primaryGenreName"] as! String
        self.itunesLink = artistDict["artistLinkUrl"] as? String
        
    }
    
    init(bookDict: [String: AnyObject]) {
        self.title = bookDict["trackCensoredName"] as! String
        self.subTitle = bookDict["description"] as! String
        self.itunesLink = bookDict["artistViewUrl"] as? String
        self.imageURL = bookDict["artworkUrl100"] as? String
    }
    
    init(movieDict: [String: AnyObject]) {
        self.title = movieDict["artistName"] as! String
        self.subTitle = movieDict["longDescription"] as! String
        self.itunesLink = movieDict["trackViewUrl"] as? String
        self.imageURL = movieDict["artworkUrl100"] as? String
        self.previewURL = movieDict["previewUrl"] as? String
    }
    
    init(podCastDict: [String: AnyObject]) {
        self.title = podCastDict["trackCensoredName"] as! String
        self.subTitle = podCastDict["artistName"] as! String
        self.itunesLink = podCastDict["trackViewUrl"] as? String
        self.imageURL = podCastDict["artworkUrl600"] as? String
    }
    
    init(musicVideoDict: [String: AnyObject]) {
        self.title = musicVideoDict["trackName"] as! String
        self.subTitle = musicVideoDict["artistName"] as! String
        self.itunesLink = musicVideoDict["trackViewUrl"] as? String
        self.imageURL = musicVideoDict["artworkUrl100"] as? String
        self.previewURL = musicVideoDict["previewUrl"] as? String
    }
    
    init(songDict: [String: AnyObject]) {
        self.title = songDict["trackName"] as! String
        self.subTitle = songDict["collectionName"] as! String
        self.itunesLink = songDict["trackViewUrl"] as? String
        self.imageURL = songDict["artworkUrl100"] as? String
        self.previewURL = songDict["previewUrl"] as? String
    }
    
}
