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
    
    var category: Category? {
        didSet {
            if let category = category {
                self.categoryLabel.text = category.name
                self.channelsCollectionsView.reloadData()
            }
        }
    }
    
    
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
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
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
    
    
    func openNewChannel() {
         print("Hello world")
    }
    
    func setupViews(){
        backgroundColor = .white
        addSubview(channelsCollectionsView)
        addSubview(categoryLabel)
        categoryLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 14, leftConstant: 8, bottomConstant: 0, rightConstant: 60, widthConstant: 0, heightConstant: 34)
        
        
        self.channelsCollectionsView.delegate = self
        self.channelsCollectionsView.dataSource = self
        
        self.channelsCollectionsView.register(NewsChannelCell.self, forCellWithReuseIdentifier: cellId)
        self.channelsCollectionsView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant: 3, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (category != nil) ? category!.channels!.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = channelsCollectionsView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsChannelCell
        
        if let category = self.category {
            cell.channel = category.channels![indexPath.item]
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150 )
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
