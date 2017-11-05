//
//  NewVC.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit

class NewsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    private let headerCellId = "headerCellId"
    
    var categories: [Category]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        fetchCategories()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationControllerSetup()
        collectionsViewsSetup()
        
    }
    
    fileprivate func fetchCategories(){
        
        var sport: Category = Category(name: "Sport")
        var business: Category = Category(name: "Business")
        var entertainment: Category = Category(name: "Entertainment")
        var gaming: Category = Category(name: "Gaming")
        var general: Category = Category(name: "General")
        var music: Category = Category(name: "Music")
        var politics: Category = Category(name: "Politics")
        var scienceAndCulture: Category = Category(name: "Science And Culture")
        var technology: Category = Category(name: "Technology")
        
        // Call Services For getting The List Of Articles
        NewsService.sharedInstance.getSources { (channels, err) in
            if err != nil {
                print("error fetching data for API")
            }
            if (channels.count > 0) {
                for channel in channels {
                    switch channel.category {
                            case "business" :
                                    business.channels?.append(channel)
                            case "entertainment":
                                    entertainment.channels?.append(channel)
                            case "gaming":
                                    gaming.channels?.append(channel)
                            case "general":
                                    general.channels?.append(channel)
                            case "music":
                                    music.channels?.append(channel)
                            case "politics":
                                    politics.channels?.append(channel)
                            case "sport" :
                                    sport.channels?.append(channel)
                            case "technology":
                                    technology.channels?.append(channel)
                            case "science-and-nature":
                                    scienceAndCulture.channels?.append(channel)
                            default:
                                print("This is the default action")
                    }
                 }
                // Adding all categories to a single collection
                var allCategories: [Category] = []
                allCategories.append(business)
                allCategories.append(entertainment)
                allCategories.append(gaming)
                allCategories.append(music)
                allCategories.append(politics)
                allCategories.append(technology)
                allCategories.append(scienceAndCulture)
                self.categories = allCategories
            }
        
        }
    }


    fileprivate func navigationControllerSetup(){
        self.navigationItem.title = "News"
    }
    
    fileprivate func collectionsViewsSetup(){
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView?.register(HeaderChannelCell.self, forCellWithReuseIdentifier: headerCellId)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId)
        collectionView?.backgroundColor = .white
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (categories != nil) ? categories!.count : 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.rootVC = self
        if let categories = self.categories {
            cell.category = categories[indexPath.item]
        }
        return cell
    }
    
    
    
    // Delegate flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        return CGSize(self.view.frame.width, 200)
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    
    // Header Flow layout 
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 60)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath) as! HeaderCell
        
        return header
    }
    
    
    
}








