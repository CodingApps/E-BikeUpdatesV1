//
//  FeedConstants.swift
//  EBikeV1-TestA
//
//  Created 9/5/18.
//

import UIKit

struct Constants {
    
    struct NewsFeed {
        static let APIScheme = "https"
        static let APIHost = "newsapi.org"
        static let APIPath = "/v2/everything"
    }
    
    struct NewsFeedParameterKeys {
        static let Method = "method"
        static let APIKey = "apiKey"
        static let Language = "language"
        static let Keywords = "q"
        static let Page = "pageSize"
    }
    
    struct NewsFeedParameterValues {
        static let q = "\"12-thread Core\""
        static let pageSize = "55"
        static let language = "en"
        static let apiKey = "1beb70a60fc143e886f476b4a99620ff"
    }
    
    struct NewsFeedResponseKeys {
        static let Status = "status"
        static let TotalResults = "totalResults"
        static let Articles = "articles"
        static let Source = "source"
        static let Author = "author"
        static let Title = "title"
        static let Description = "description"
        static let Url = "url"
        static let UrlToImage = "urlToimage"
        static let PublishedAt = "publishedAt"
    }
}
