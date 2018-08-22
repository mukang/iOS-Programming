//
//  FlickrAPI.swift
//  Photorama
//
//  Created by 穆康 on 2018/8/22.
//  Copyright © 2018年 穆康. All rights reserved.
//

import Foundation

enum Method: String {
    case recentPhotos = "flickr.photos.getRecent"
}

struct FlickrAPI {
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let APIKey = "a6d819499131071f158fd740860a5a88"
    
    private static func flickrURL(method: Method, parameters: [String: String]?) -> URL {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": APIKey
        ]
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.url!
    }
    
    static func recentPhotosURL() -> URL {
        return flickrURL(method: .recentPhotos, parameters: ["extras": "url_h,date_taken"])
    }
}
