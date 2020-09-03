//
//  newsModel.swift
//  gccNews
//
//  Created by Erick Emmanuel Tamez Leal on 02/09/20.
//  Copyright © 2020 Erick Emmanuel Tamez Leal. All rights reserved.
//

import Foundation
struct Welcome: Decodable {
    let status: String?
    let totalResults: Int?
    //let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let author: String?
    let title:String
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
}
