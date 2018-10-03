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
    
    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
    
    static func getMockup() -> [SearchResult] {
        return [SearchResult(title: "hi", subTitle: "hello"),
                SearchResult(title: "hi", subTitle: "hello"),
                SearchResult(title: "hi", subTitle: "hello"),
                SearchResult(title: "hi", subTitle: "hello"),
                SearchResult(title: "hi", subTitle: "hello")]
    }
    
}
