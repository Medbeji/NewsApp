//
//  News.swift
//  NewsTest
//
//  Created by MedBeji on 04/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import Foundation


struct ArticleContainer: Decodable {
    let status : String
    let source : String
    let sortBy: String?
    let articles : [Article]
}



struct Article: Decodable {
    
    let author : String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    
}
