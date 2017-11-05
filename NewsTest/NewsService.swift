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
        
    
}
