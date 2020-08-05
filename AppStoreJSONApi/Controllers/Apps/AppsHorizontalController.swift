//
//  AppsHorizontalController.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 16.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit

class AppsHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    let horizontalCellId = "horizonCell"
    
    var appGroup: AppsGroup?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 10
        collectionView.clipsToBounds = true
        collectionView.register(AppsHorizontalCell.self, forCellWithReuseIdentifier: horizontalCellId)
        collectionView.contentInset = .init(top: 0, left: 8, bottom: 0, right: 8)
//        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//
//        }
    }
    
    var selectionHendler: ((FeedResult) -> ())?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard  let choosenApp = appGroup?.feed.results[indexPath.item] else {return}
        selectionHendler?(choosenApp)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: horizontalCellId, for: indexPath) as! AppsHorizontalCell
        let content = appGroup?.feed.results[indexPath.item]
        cell.appIcon.sd_setImage(with: URL(string: content?.artworkUrl100 ?? ""))
        cell.nameLabel.text = content?.name
        cell.companyLabel.text = content?.artistName
        
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
        
    let lineSpacing: CGFloat = 10
    let topbottomInsets: CGFloat = 12
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.height - 2*topbottomInsets - 2*lineSpacing
        return.init(width: view.frame.width - 35, height: height / 3  )
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return.init(top: topbottomInsets, left: 8, bottom: topbottomInsets, right: 8)
//    }

}
