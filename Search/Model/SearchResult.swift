//
//  SearchResult.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class SearchResult {
    var title: String
    var subTitle: String
    var imageURL : String?
    var videoURL : String?
    var itunesLink: String?
    
    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
    
    init(AlbumDict: [String: AnyObject]) {
        self.title = AlbumDict["collectionName"] as! String
        self.subTitle = AlbumDict["collectionCensoredName"] as! String
        self.imageURL = AlbumDict["artworkUrl100"] as? String
        self.itunesLink = AlbumDict["collectionViewUrl"] as? String
    }
    
    init(ArtistDict: [String: AnyObject]) {
        self.title = ArtistDict["artistName"] as! String
        self.subTitle = ArtistDict["primaryGenreName"] as! String
        self.itunesLink = ArtistDict["artistLinkUrl"] as? String
        
    }
    
    init(BookDict: [String: AnyObject]) {
        self.title = BookDict["trackCensoredName"] as! String
        self.subTitle = BookDict["description"] as! String
        self.itunesLink = BookDict["artistViewUrl"] as? String
        self.imageURL = BookDict["artworkUrl100"] as? String
    }
    
    init(MovieDict: [String: AnyObject]) {
        self.title = MovieDict["artistName"] as! String
        self.subTitle = MovieDict["longDescription"] as! String
        self.itunesLink = MovieDict["trackViewUrl"] as? String
        self.imageURL = MovieDict["artworkUrl100"] as? String
        self.videoURL = MovieDict["previewUrl"] as? String
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
        self.videoURL = musicVideoDict["previewUrl"] as? String
    }
    
    init(songDict: [String: AnyObject]) {
        self.title = songDict["trackName"] as! String
        self.subTitle = songDict["collectionName"] as! String
        self.itunesLink = songDict["trackViewUrl"] as? String
        self.imageURL = songDict["artworkUrl100"] as? String
        self.videoURL = songDict["previewUrl"] as? String
    }
    
    
    
    static func getMockup() -> [SearchResult] {
        return [SearchResult(title: "hi", subTitle: "hello"),
                SearchResult(title: "hi", subTitle: "hello"),
                SearchResult(title: "hi", subTitle: "hello"),
                SearchResult(title: "hi", subTitle: "hello"),
                SearchResult(title: "hi", subTitle: "hello")]
    }
    
}
