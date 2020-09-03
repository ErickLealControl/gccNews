//
//  newsRequest.swift
//  gccNews
//
//  Created by Erick Emmanuel Tamez Leal on 02/09/20.
//  Copyright © 2020 Erick Emmanuel Tamez Leal. All rights reserved.
//

import Foundation
var semaphore = DispatchSemaphore (value: 0)

enum NewsError:Error {
    case noData
    case canNotProcessData
}

struct NewsRequest{
    let resourceURL:URL
    let apiKey = "78b7a2c692f5405dab5fbdb1fda2115a"
    
    
    init(country:String,category:String){
        var resourceString:String
        if category == "" {
            resourceString = "http://newsapi.org/v2/top-headlines?country=MX&apiKey=\(apiKey)"
        }else{
            resourceString = "http://newsapi.org/v2/top-headlines?country=\(country)&category=\(category)&apiKey=\(apiKey)"
        }
        
        guard let resourceURL = URL(string: resourceString)else {fatalError()}
        self.resourceURL = resourceURL
    }
    func getNews (completion: @escaping(Result<[Articles], NewsError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            
            /*print(String(data: jsonData, encoding: .utf8)!)
            semaphore.signal()*/
            let jsonDecoder = JSONDecoder()
            let responseModel = try? jsonDecoder.decode(newsResponse.self, from: jsonData)
            
            let articleDetail = responseModel?.articles
            completion(.success(articleDetail!))
            
        }
        dataTask.resume()
        
    }
    
}
