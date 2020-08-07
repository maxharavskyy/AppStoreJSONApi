//
//  AppsDetailController.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 21.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit


class AppsDetailController: BaseListController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
    }
}

class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
