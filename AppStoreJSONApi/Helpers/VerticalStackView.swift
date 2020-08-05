//
//  VerticalStackView.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 14.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.axis = .vertical
        self.spacing = spacing
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
