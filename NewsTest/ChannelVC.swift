//
//  ChannelVC.swift
//  NewsTest
//
//  Created by MedBeji on 03/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit

private let newsCellId = "newsCellId"

class ChannelVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    private let headerCellId = "headerChannelCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
       

        // Register cell classes
        self.collectionView!.register(NewsCell.self, forCellWithReuseIdentifier: newsCellId)
        collectionView?.register(HeaderChannelCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId)
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newsCellId, for: indexPath) as! NewsCell
    
        // Passing the current UICollectionViewController to the cell ( For navigation purpose)
        cell.rootVC = self
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: 150)
    }
    
    
    
    // Header flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        // TODO: We need to calculate the height of the text depending on the text size
        
        return CGSize(width: self.view.frame.width, height: 140)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath) as! HeaderCell
        
        return header
    }

    
    

}
