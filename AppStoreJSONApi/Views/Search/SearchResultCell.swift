//
//  SearchResultCell.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 14.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            appIconImageView.sd_setImage(with: URL(string: appResult.artworkUrl100))
            screenShot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1 {
                screenShot2ImagewView.sd_setImage(with: URL(string: appResult.screenshotUrls[1])) }
            if appResult.screenshotUrls.count > 2 {
                screenShot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2])) }
        }
    }
    
    
    
      let appIconImageView: UIImageView = {
         let iv = UIImageView()
         iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
         iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
         iv.layer.cornerRadius = 12
         iv.clipsToBounds = true
         return iv
     }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Label"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo & Video"
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
     lazy var screenShot1ImageView = self.createImageView()
     lazy var screenShot2ImagewView = self.createImageView()
     lazy var screenShot3ImageView = self.createImageView()
    
    func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.contentMode = .scaleToFill
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        
        return imageView
    }
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
   
        backgroundColor = .white
        

        let screenShotStack = UIStackView(arrangedSubviews: [screenShot1ImageView, screenShot2ImagewView, screenShot3ImageView])
        screenShotStack.distribution = .fillEqually
        screenShotStack.spacing = 8
        
        
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel]), getButton])
        infoTopStackView.alignment = .center
        infoTopStackView.spacing = 12
        
        let containerStackView = VerticalStackView(arrangedSubviews: [infoTopStackView, screenShotStack], spacing: 16)

        
        addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        
        ])
        
        
    }
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
