//
//  HeaderChannelCell.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit

class HeaderChannelCell : HeaderCell {

    var channelVC : ChannelVC?
    
    var channel: Channel? {
        didSet{
            if let channel = channel {
                 // Check if we can do popular, top, latest
                print(channel.sortBysAvailable)
                for sort in channel.sortBysAvailable {
                    switch sort {
                        case "top":
                            print("wait")
                            topBtn.alpha = 1
                    case "latest":
                            print("change latest")
                            latestBtn.alpha = 1
                        case  "popular":
                            print("change popular")
                            popularBtn.alpha = 1
                    default:
                        print("this is the default switch")
                    }
                }
                 // Update the header and description
                self.headerLabel.text = channel.name
                self.channelDescription.text = channel.description
            }
        }
    }
    
    lazy var latestBtn : UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "latest"), for: .normal)
        btn.alpha = 0.2
        btn.addTarget(self, action: #selector(self.latestBtnTapped(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var popularBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "popular"), for: .normal)
        btn.alpha = 0.2
        btn.addTarget(self, action: #selector(self.popularBtnTapped(sender:)), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var topBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "top"), for: .normal)
        btn.alpha = 0.2
        btn.addTarget(self, action: #selector(self.topBtnTapped(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var sortingByDate : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "sorting-top"), for: .normal)
        btn.tag = 0
        btn.addTarget(self, action: #selector(self.sortingBtnTapped(sender:)), for: .touchUpInside)
        return btn
    }()
    
    
    let channelDescription: UITextView = {
        let text = UITextView()
        text.text = "osdjfosdjfiosodfisdfij sdjfo^sdifjos^dfj i^sdjfi sdfjs^djf s^dfjsd^fijsdfisid^fi^sdifs^dfjs^djfisdi^fjisdfji sdîfjsdkfjsodfsjdfomsnvjdgiushsdgsmdgds;fks,dfsdjifjsdfùdsjf"
        text.font =  .systemFont(ofSize: 13)
        text.textColor = .gray
        text.isScrollEnabled = false
        text.isEditable = false
        text.isSelectable = true
        return text
    }()
    
    override func setupViews() {
        
        addSubview(latestBtn)
        addSubview(popularBtn)
        addSubview(channelDescription)
        addSubview(topBtn)
        addSubview(headerLabel)
        addSubview(sortingByDate)

        latestBtn.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 32, leftConstant: 0, bottomConstant: 0, rightConstant: 14, widthConstant: 33, heightConstant: 42)
        
        popularBtn.anchor(topAnchor, left: nil, bottom: nil, right: latestBtn.leftAnchor, topConstant: 32, leftConstant: 0, bottomConstant: 0, rightConstant: 5, widthConstant: 33, heightConstant: 42)
        
        topBtn.anchor(topAnchor, left: nil, bottom: nil, right: popularBtn.leftAnchor, topConstant: 32, leftConstant: 0, bottomConstant: 0, rightConstant: 5, widthConstant: 30, heightConstant: 42)
        
        headerLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: topBtn.leftAnchor, topConstant: 25, leftConstant: 8, bottomConstant: 0, rightConstant: 3, widthConstant: 0, heightConstant: 45)
        
        channelDescription.anchor(headerLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 8, bottomConstant: 30, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        sortingByDate.anchor(channelDescription.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 30, heightConstant: 30)
        
    }
    
     @objc fileprivate func sortingBtnTapped(sender: UIButton) {
    
         self.channelVC?.sorting(type: (sender.tag == 0) ? .ascending : .descending)
         if sender.tag == 0 {
         sender.setImage(UIImage(named: "sorting-bottom"), for: .normal)
         sender.tag = 1
         }else {
         sender.setImage(UIImage(named: "sorting-top"), for: .normal)
         sender.tag = 0
         }
 
    }
    
    @objc fileprivate func latestBtnTapped(sender: UIButton) {
        if sender.alpha == 1 {
            self.channelVC?.sortBy(type: "latest")
        } else {
            print("sorry no action for that")
        }
        
    }
    
    @objc fileprivate func popularBtnTapped(sender: UIButton) {
        if sender.alpha == 1 {
            self.channelVC?.sortBy(type: "popular")
        } else {
            print("sorry no action for that")
        }
        
    }
    
    @objc fileprivate func topBtnTapped(sender: UIButton) {
        if sender.alpha == 1 {
            self.channelVC?.sortBy(type: "top")
        } else {
            print("sorry no action for that")
        }    }
    
}
