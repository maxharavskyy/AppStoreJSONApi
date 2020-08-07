//
//  AppsController.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 16.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit
import Alamofire


class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "id"
    let headerId = "headerId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    var sectionGroup = [AppsGroup]()
    var socialApps = [SocialApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addSubview(activityIndicatorView)
        collectionView.backgroundColor = UIColor(white: 0.85, alpha: 0.5)
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.topAnchor.constraint(equalTo: view.topAnchor),
            activityIndicatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            activityIndicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activityIndicatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        fetchData()
    }
    
    func fetchData() {
        let group = DispatchGroup()
        var group1: AppsGroup?
        var group2: AppsGroup?
        var group3: AppsGroup?
        
        group.enter()
        Service.shared.fetchGrossingGames { (result, error) in
            group.leave()
            group1 = result
        }
        group.enter()
        Service.shared.fetchFree { (res, err) in
            group.leave()
            group2 = res
        }
        group.enter()
        Service.shared.fetchPopular { (res, err) in
            group.leave()
            group3 = res
        }
        group.enter()
        AlamofireNetworkRequest.sendRequest(onSucess: { (apps) in
            group.leave()
            guard let apps = apps else {return}
            self.socialApps = apps
        }) {
            print("error alamofire fetching request")
        }
        
        group.notify(queue: .main) {
            self.activityIndicatorView.stopAnimating()
            if let group = group1 {
                self.sectionGroup.append(group)
            }
            if let group = group2 {
                self.sectionGroup.append(group)
            }
            if let group = group3 {
            self.sectionGroup.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        let data = sectionGroup[indexPath.item]
        cell.horizontalController.appGroup = data
        cell.sectionLabel.text = data.feed.title
        cell.horizontalController.collectionView.reloadData()
        cell.horizontalController.selectionHendler = {[weak self] feedResult in
            let detailController = AppsDetailController()
            self?.navigationController?.pushViewController(detailController, animated: true)
            detailController.navigationItem.title = feedResult.name
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionGroup.count
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: collectionView.frame.width-16 , height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return.init(top: 8, left: 16, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.appsHeaderHorizontalController.socialApps = self.socialApps
        header.appsHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: 300)
    }
    
}
