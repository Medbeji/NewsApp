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
    
    let gridView : UIView = {
      
        let view = UIView()
        view.backgroundColor = .green
        return view
        
    }()
    
    let newsImage:  UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .gray
        return image
    }()
    
    
    override func setupViews() {
        backgroundColor = .red
        
        addSubview(gridView)
        gridView.addSubview(newsImage)
        
        
        let emptySpace = ( UIScreen.main.bounds.width - 40 ) * 0.58
        
        
        gridView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 7, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        newsImage.anchor(gridView.topAnchor, left: gridView.leftAnchor, bottom: gridView.bottomAnchor, right: gridView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: emptySpace , widthConstant: 0, heightConstant: 0)
    }

}

