//
//  PhotoStore.swift
//  Photorama
//
//  Created by 穆康 on 2018/8/22.
//  Copyright © 2018年 穆康. All rights reserved.
//

import Foundation

class PhotoStore {
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchRecentPhotos() {
        let url = FlickrAPI.recentPhotosURL()
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let jsonData = data {
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                } else if let requestError = error {
                    print("Error fetching recent photos: \(requestError)")
                } else {
                    print("Unexpected error with the reques")
                }
            }
        }
        task.resume()
    }
}
