//
//  NewsService.swift
//  NewsTest
//
//  Created by MedBeji on 04/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import Foundation


struct NewsService {
    
    static let sharedInstance = NewsService()
    private let API_KEY = "b365e174a8e64bf1b07df1928624479d"
    
    
    // Get list of sources
    func getSources(completion: @escaping ([Channel],Error?) -> ()){
        guard let url = URL(string: "https://newsapi.org/v1/sources?language=en") else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                completion([],error)
                return
            }
            guard let data = data else { return }
            do {
                    let categories = try JSONDecoder().decode(Sources.self, from: data)
                    completion(categories.sources,nil)
                
            }catch let jsonErr {
                    print("Error serializing json", jsonErr)
            }
        }).resume()
    }
    
    // Get list of articles
    func getNews(source: String, sortBy: String,completion: @escaping ([Article],Error?) -> ()){
        guard let url = URL(string: "https://newsapi.org/v1/articles?source=\(source)&sortBy=\(sortBy)&apiKey=\(API_KEY)") else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                completion([],error)
                return
            }
            guard let data = data else { return }
            do {
                let articlesContainer = try JSONDecoder().decode(ArticleContainer.self, from: data)
                completion(articlesContainer.articles,nil)
            }catch let jsonErr {
                print("Error serializing json", jsonErr)
            }
        }).resume()
    }
    
    
}
