//
//  HeaderChannelCell.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit

class HeaderChannelCell : HeaderCell {

    let sortingBtn : UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "sorting-bottom"), for: .normal)
//        btn.backgroundColor = .green
        return btn
    }()
    
    let popularBtn : UIButton = {
        let btn = UIButton()
                btn.setImage(UIImage(named: "popular"), for: .normal)
//        btn.backgroundColor = .green
        return btn
    }()
    
    let channelDescription: UITextView = {
       
        let text = UITextView()
        text.text = "osdjfosdjfiosodfisdfij sdjfo^sdifjos^dfj i^sdjfi sdfjs^djf s^dfjsd^fijsdfisid^fi^sdifs^dfjs^djfisdi^fjisdfji sdîfjsdkfjsodfsjdfomsnvjdgiushsdgsmdgds;fks,dfsdjifjsdfùdsjf"
        text.font =  .systemFont(ofSize: 13)
        text.backgroundColor = .yellow
        text.textColor = .gray
        return text
    }()
    
    override func setupViews() {
        
        addSubview(headerLabel)
        addSubview(sortingBtn)
        addSubview(popularBtn)
        addSubview(channelDescription)

        
        headerLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 20, leftConstant: 8, bottomConstant: 0, rightConstant: 34, widthConstant: 0, heightConstant: 45)
        
        sortingBtn.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 32, leftConstant: 0, bottomConstant: 0, rightConstant: 14, widthConstant: 30, heightConstant: 30)
        
        popularBtn.anchor(topAnchor, left: nil, bottom: nil, right: sortingBtn.leftAnchor, topConstant: 32, leftConstant: 0, bottomConstant: 0, rightConstant: 5, widthConstant: 30, heightConstant: 30)
        
        channelDescription.anchor(headerLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
    }
}
