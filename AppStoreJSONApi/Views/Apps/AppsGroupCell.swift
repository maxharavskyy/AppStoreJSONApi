//
//  AppsGroupCell.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 16.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let horizontalController = AppsHorizontalController()
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "App section"
        label.font = UIFont(name: "GoogleSans-Regular", size: 22)
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(sectionLabel)
        addSubview(horizontalController.view)
        backgroundColor = UIColor(white: 0.85, alpha: 0)
        
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: topAnchor),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalController.view.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 5),
            horizontalController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 9),
            horizontalController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
