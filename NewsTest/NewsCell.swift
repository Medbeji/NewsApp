//
//  NewsCell.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit

class NewsCell : NewsChannelCell {
    
    var rootVC: ChannelVC?
    var article: Article? {
        didSet {
            if let article = article {
                if let url = article.urlToImage{
                    newsImage.loadImage(urlString: url)
                }
                newsTitle.text = article.title
                if let publishedAt = article.publishedAt {
                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                    let publishDateFormatted = String(publishedAt.prefix(19))
                    if let date = dateFormatter.date(from:publishDateFormatted) {
                            dateFormatter.dateFormat = "MMM d, h:mm a"
                            newsDateLabel.text = dateFormatter.string(from: date)
                    }
                } else {
                     newsDateIcon.alpha = 1
                }
               
            }
        }
    }
    
    
    lazy var gridView : UIView = {
        let view = UIView()
        // Add Shadow to GridView
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 4.0
        view.layer.shadowOpacity = 1.5
        view.layer.masksToBounds = false
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        return view
    }()
    
    
    let newsImage:  CachedImageView = {
       let image = CachedImageView()
//        image.backgroundColor = .gray
        return image
    }()
    
    let newsTitle: UILabel = {
       let label = UILabel()
        label.text = "This is random title for the project that can fits the size of the box so I need to see the font size is  changing depending on the long text"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 4
        label.sizeToFit()
        return label
    }()
    
    let newsDateIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clock")
        return image
    }()
    
    let newsDateLabel:  UILabel = {
       let lb = UILabel()
        lb.text = "this is a date"
        lb.font = .systemFont(ofSize: 13)
        lb.textColor = .gray
        return lb
    }()
    
    
    
    override func setupViews() {
        
        
        addSubview(gridView)
        gridView.addSubview(newsImage)
        gridView.addSubview(newsTitle)
        gridView.addSubview(newsDateIcon)
        gridView.addSubview(newsDateLabel)
        
        let emptySpace = ( UIScreen.main.bounds.width - 40 ) * 0.58
        
        
        gridView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 7, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        newsImage.anchor(gridView.topAnchor, left: gridView.leftAnchor, bottom: gridView.bottomAnchor, right: gridView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: emptySpace , widthConstant: 0, heightConstant: 0)
       
        newsTitle.anchor(gridView.topAnchor, left: newsImage.rightAnchor, bottom: gridView.bottomAnchor, right: gridView.rightAnchor, topConstant: 8, leftConstant: 3, bottomConstant: 30, rightConstant: 2, widthConstant: 0, heightConstant: 0)
        
        newsDateIcon.anchor(newsTitle.bottomAnchor, left: newsImage.rightAnchor, bottom: nil, right: nil, topConstant: 2, leftConstant: 3, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        newsDateLabel.anchor(newsTitle.bottomAnchor, left: newsDateIcon.rightAnchor, bottom: nil, right: gridView.rightAnchor, topConstant: 2, leftConstant: 2, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
    }

    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        
        // Here we open the new tap for the information
        let newsDetailVC = NewsDetailVC()
        if let url = self.article?.url {
            newsDetailVC.urlString = url
        }
        rootVC?.navigationController?.pushViewController(newsDetailVC, animated: true)
        
    }
    
    
}

