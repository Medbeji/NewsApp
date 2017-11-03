//
//  NewVC.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit

class NewsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // DESIGN Attributs
    
        /* NOTE : SPORTS */

//        lazy var sportCollectionView: UICollectionView = {
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .horizontal
//            layout.minimumLineSpacing = 15
//            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//            cv.backgroundColor  = .clear
////            cv.dataSource = self
////            cv.delegate = self
//            cv.contentInset =  UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
//            return cv
//        }()
    
    
       /* NOTE : Datasources */
    
    
    
    
    
    private let cellId = "cellId"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationControllerSetup()
        collectionsViewsSetup()
        
    }
    
    fileprivate func navigationControllerSetup(){
        self.navigationItem.title = "News"
    }
    
    fileprivate func collectionsViewsSetup(){
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.backgroundColor = .white
    
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        
        
        return cell
    }
    
    
    
    // Deleaget flow layout 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        return CGSize(self.view.frame.width, 200)
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    
    
}


class CategoryCell : UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
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
    
    func setupViews(){
        backgroundColor = .blue
        addSubview(channelsCollectionsView)
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
    
}

class NewsChannelCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = .red
    }
    
}





