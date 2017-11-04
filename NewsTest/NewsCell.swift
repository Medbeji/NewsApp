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
    
    
    lazy var gridView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        return view
    }()
    
    
    let newsImage:  UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .gray
        return image
    }()
    
    let newsTitle: UILabel = {
       let label = UILabel()
        label.text = "This is random title for the project that can fits the size of the box so I need to see the font size is  changing depending on the long text"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 4
        label.backgroundColor = .blue
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
        backgroundColor = .red
        
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
        rootVC?.navigationController?.pushViewController(newsDetailVC, animated: true)
        
    }
    
    
}

