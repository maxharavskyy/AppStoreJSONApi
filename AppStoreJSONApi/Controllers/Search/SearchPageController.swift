//
//  AppsSearchController.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 14.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit
import SDWebImage


class SearchPageController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    fileprivate let cellId = "123"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate var appResults = [Result]()
    
    fileprivate let entryLabeIfEmpty: UILabel = {
        let label = UILabel()
        label.text = "Please provide some search.."
        label.textColor = UIColor(white: 0.5, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    override func viewDidLoad() {
   
        super.viewDidLoad()
        collectionView.addSubview(entryLabeIfEmpty)
        entryLabeIfEmpty.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            entryLabeIfEmpty.topAnchor.constraint(equalTo: view.topAnchor, constant: 220),
//             entryLabelForEmpty.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             entryLabeIfEmpty.leadingAnchor.constraint(equalTo: view.leadingAnchor ),
             entryLabeIfEmpty.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        ])

        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        setupSearchBar()
    
    }
   

    
    
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = self.searchController
//        searchController.searchBar.isHidden = false
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false, block: { (_) in
            Service.shared.fetchSearch(searchTerm: searchText) { (result, err) in
                self.appResults = result?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    
    

    fileprivate func  fetchItunesApps() {
        Service.shared.fetchSearch(searchTerm: "") { (results, error)  in

            if let error = error {
                print("failed fetch data", error)
            }
            self.appResults = results?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        let appResult = appResults[indexPath.item]
        cell.appResult = appResult
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        entryLabeIfEmpty.isHidden = appResults.count != 0
        return appResults.count
    }
    
    
    
    
    
}
