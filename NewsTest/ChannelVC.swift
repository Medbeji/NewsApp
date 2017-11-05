//
//  ChannelVC.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit

private let newsCellId = "newsCellId"

class ChannelVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var articles : [Article]? {
        didSet {
            if let _ = articles {
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            }
        }
    }
    
    
    var channel : Channel? {
        didSet {
            if let channel = channel {
                // Call API services to get list of news of the selected channel
                NewsService.sharedInstance.getNews(source: channel.id, sortBy: channel.sortBysAvailable[0], completion: { (articles, err) in
                    
                    if err != nil {
                        return
                    }
                    if articles.count > 0 {
                        self.articles = articles
                    }
                    
                })
                
                // Update the collection view list with this list of news
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            }
            
        }
    }
    
    private let headerCellId = "headerChannelCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
       

        // Register cell classes
        self.collectionView!.register(NewsCell.self, forCellWithReuseIdentifier: newsCellId)
        collectionView?.register(HeaderChannelCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId)
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ( articles != nil ) ? articles!.count : 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newsCellId, for: indexPath) as! NewsCell
        // Passing the current UICollectionViewController to the cell ( For navigation purpose)
        cell.rootVC = self
        if let articles = self.articles {
            cell.article = articles[indexPath.item]
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: 150)
    }
    
    
    
    // Header flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        // TODO: We need to calculate the height of the text depending on the text size
        if let channel = channel{
           
                let approximateWidthOfTextView = view.frame.width - 16
                let size = CGSize(width: approximateWidthOfTextView, height: 1000)
                let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)]
                let estimatedFrame1 = NSString(string: channel.description).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
          return CGSize(width: self.view.frame.width, height: estimatedFrame1.height+140.0)
        }
        return CGSize(width: self.view.frame.width, height: 140)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath) as! HeaderChannelCell
        header.channelVC = self
        if let channel = channel {
            header.channel = channel
        }
        return header
    }

   struct SortedArticle {
        let article : Article
        let date : Date
        init(article: Article, date: Date) {
            self.article = article
            self.date = date
        }
    }
    
    enum SortingType {
        case ascending
        case descending
    }
    
    // Sorting Methods
    func sorting(type: SortingType) {
        
        guard let articles = articles else { return }
        // Create a New
        var sortedArticleDesc : [SortedArticle] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        for article in articles {
            let date = dateFormatter.date(from: String(article.publishedAt!.prefix(18)))
            if let date = date {
                sortedArticleDesc.append(SortedArticle(article: article,date: date))
            }
        }
        if type == .ascending {
                sortedArticleDesc = sortedArticleDesc.sorted(by: { $0.date.compare($1.date) == .orderedAscending})
        } else {
            sortedArticleDesc = sortedArticleDesc.sorted(by: { $0.date.compare($1.date) == .orderedDescending})
        }
        

        var sortedArticles: [Article] = []
        for sorted in sortedArticleDesc {
             sortedArticles.append(sorted.article)
        }
        self.articles = sortedArticles
    }
    
    func sortBy(type: String) {
        
        NewsService.sharedInstance.getNews(source: self.channel!.id, sortBy: type, completion: { (articles, err) in
            
            if err != nil {
                return
            }
            if articles.count > 0 {
                self.articles = articles
            }
            
        })
        
    }
    
    
    
    
    

}
