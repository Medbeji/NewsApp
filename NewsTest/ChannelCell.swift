//
//  ChannelCell.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit

class NewsChannelCell : UICollectionViewCell {
    
   
    var channel: Channel? {
        didSet {
            
            if let channel = channel {
                imageView.loadImage(urlString: "https://mynews_data.s3.amazonaws.com/\(channel.id).png")
            }
        }
    }
    
    
    let contentCellView : UIView = {
       let myView = UIView()
        myView.backgroundColor = .white
        myView.layer.shadowColor = UIColor.lightGray.cgColor
        myView.layer.shadowOffset = .zero
        myView.layer.shadowRadius = 4.0
        myView.layer.shadowOpacity = 1.5
        myView.layer.masksToBounds = false
        return myView
    }()
    
    let imageView: CachedImageView = {
       let image = CachedImageView()
        return image
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(contentCellView)
        contentCellView.addSubview(imageView)
        contentCellView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10 , leftConstant: 4, bottomConstant: 10, rightConstant: 4, widthConstant: 0, heightConstant: 0)
        imageView.anchor(contentCellView.topAnchor, left: contentCellView.leftAnchor, bottom: contentCellView.bottomAnchor, right: contentCellView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        backgroundColor = .white
    }
    
   
    
}
