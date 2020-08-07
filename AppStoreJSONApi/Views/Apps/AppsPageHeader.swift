//
//  AppsPageHeader.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 16.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
   
    let appsHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(appsHeaderHorizontalController.view)
        appsHeaderHorizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appsHeaderHorizontalController.view.topAnchor.constraint(equalTo: topAnchor),
            appsHeaderHorizontalController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            appsHeaderHorizontalController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appsHeaderHorizontalController.view.trailingAnchor.constraint(equalTo: trailingAnchor)
         ])
        appsHeaderHorizontalController.view.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
