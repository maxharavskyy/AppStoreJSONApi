//
//  AppsHorizontalCell.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 16.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit

class AppsHorizontalCell: UICollectionViewCell {
    
    let appIcon: UIImageView = {
      let icon = UIImageView()
        icon.backgroundColor = .red
        icon.widthAnchor.constraint(equalToConstant: 64).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 64).isActive = true
        icon.layer.cornerRadius = 8
        icon.clipsToBounds = true
        icon.contentMode = .scaleToFill
        return icon
    }()
    
    let nameLabel: UILabel = {
       let nLabel = UILabel()
        nLabel.text = "Name Label"
        nLabel.font = UIFont(name: "GoogleSans-Regular", size: 20)
        return nLabel
    }()
    
    let companyLabel: UILabel = {
        let cLabel = UILabel()
        cLabel.text = "Company Name"
        cLabel.font = UIFont(name: "GoogleSans-Regular", size: 13)
        cLabel.textColor = UIColor(white: 0.5, alpha: 0.7)
        return cLabel
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = UIFont(name: "GoogleSans-Regular", size: 22)
        button.backgroundColor = .white
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 32 / 2
        button.clipsToBounds = true
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
                
        let stackView = UIStackView(arrangedSubviews: [appIcon, VerticalStackView(arrangedSubviews: [nameLabel, companyLabel],spacing: 4), getButton])
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
        stackView.alignment = .center
        stackView.spacing = 16
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
