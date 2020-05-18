//
//  DMAnimatedButton.swift
//  BasicAnimations
//
//  Created by Denis Mordvinov on 18.05.2020.
//  Copyright © 2020 Denis Mordvinov. All rights reserved.
//

import UIKit

class DMAnimatedButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame:frame)
        phaseTwo(title: "Button")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 150).isActive = true
        heightAnchor.constraint(equalToConstant: 54).isActive = true
        phaseTwo(title: title)
    }
    
    fileprivate func phaseTwo(title: String){
        
        layer.cornerRadius = 12
        backgroundColor = .blue
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
