//
//  CategoryCell.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit



class CategoryCell : UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    var rootVC: NewsVC?
    
    private let cellId = "channelCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let channelsCollectionsView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .yellow
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    
    let categoryLabel : UILabel = {
       let label = UILabel()
        label.text = "Category 1"
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let seeAllBtn : UIButton = {
       let btn = UIButton()
        btn.setTitle("see all", for: .normal)
        btn.addTarget(self, action: #selector(openNewChannel), for: .touchUpInside)
        return btn
    }()
    
    
    func openNewChannel() {
         print("Hello world")
    }
    
    func setupViews(){
        backgroundColor = .blue
        addSubview(channelsCollectionsView)
        addSubview(categoryLabel)
        addSubview(seeAllBtn)
        categoryLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 14, leftConstant: 8, bottomConstant: 0, rightConstant: 60, widthConstant: 0, heightConstant: 34)
        seeAllBtn.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 12 , leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 28)
        
        
        self.channelsCollectionsView.delegate = self
        self.channelsCollectionsView.dataSource = self
        
        self.channelsCollectionsView.register(NewsChannelCell.self, forCellWithReuseIdentifier: cellId)
        self.channelsCollectionsView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 50, leftConstant: 10, bottomConstant: 3, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = channelsCollectionsView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsChannelCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // We get The channel model information from the table
        
        
        // here we pass the id of the selected channel and push to the next channel
        let layout = UICollectionViewFlowLayout()
        let channelVC = ChannelVC(collectionViewLayout: layout)
        // channelVC.channel = selectedChannel
        
        rootVC?.navigationController?.pushViewController(channelVC, animated: true)
        
        
    }
    
    
}
