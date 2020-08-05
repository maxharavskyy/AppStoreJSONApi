//
//  AppsHeaderCell.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 16.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
   
    let someImage: UIImageView = {
      let icon = UIImageView()
        
//        icon.widthAnchor.constraint(equalToConstant: 64).isActive = true
//        icon.heightAnchor.constraint(equalToConstant: 64).isActive = true
        icon.layer.cornerRadius = 8
        icon.clipsToBounds = true
        icon.contentMode = .scaleToFill
        return icon
    }()
    
    let someLabel: UILabel = {
       let nLabel = UILabel()
        nLabel.numberOfLines = 2
        nLabel.font = UIFont(name: "GoogleSans-Regular", size: 26)
        
        return nLabel
    }()
    
    let companyLabel: UILabel = {
        let cLabel = UILabel()
        cLabel.text = "Facebook"
//        cLabel.font = UIFont.systemFont(ofSize: 16)
        cLabel.font = UIFont(name: "GoogleSans-Regular", size: 12)
        cLabel.textColor = UIColor(white: 0.5, alpha: 0.7)
        
        return cLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
       
        
        let stackView1 = VerticalStackView(arrangedSubviews: [
        companyLabel, someLabel, someImage
        ], spacing: 12)
        addSubview(stackView1)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView1.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView1.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
