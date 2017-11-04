//
//  NewVC.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit

class NewsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    
    private let cellId = "cellId"
    private let headerCellId = "headerCellId"

    
    let categories : [Category]? = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fetchCategories()
        navigationControllerSetup()
        collectionsViewsSetup()
        
    }
    
    
    fileprivate func fetchCategories(){
        // Call Services For getting The List Of Articles
        
        
        
        
    }
    
    fileprivate func navigationControllerSetup(){
        self.navigationItem.title = "News"
    }
    
    fileprivate func collectionsViewsSetup(){
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView?.register(HeaderChannelCell.self, forCellWithReuseIdentifier: headerCellId)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId)
        collectionView?.backgroundColor = .white
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.rootVC = self
        return cell
    }
    
    
    
    // Delegate flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        return CGSize(self.view.frame.width, 200)
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    
    // Header Flow layout 
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 60)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath) as! HeaderCell
        
        return header
    }
    
    
    
}








