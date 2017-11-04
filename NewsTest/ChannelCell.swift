//
//  ChannelCell.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit
class NewsChannelCell : UICollectionViewCell {
    
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(contentCellView)
        contentCellView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10 , leftConstant: 4, bottomConstant: 10, rightConstant: 4, widthConstant: 0, heightConstant: 0)
        backgroundColor = .white
    }
    
    fileprivate func addShadow(){
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius:contentView.layer.cornerRadius).cgPath
    }
    
}
