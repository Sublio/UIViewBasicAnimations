//
//  ViewPropertyAnimator.swift
//  BasicAnimations
//
//  Created by Denis Mordvinov on 18.05.2020.
//  Copyright © 2020 Denis Mordvinov. All rights reserved.
//

import Foundation
import UIKit

class ViewoPropertyAnimator: UIViewController {
    
    let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
    
    var boxWidthAnchor: NSLayoutConstraint!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(box)
        boxWidthAnchor = box.widthAnchor.constraint(equalToConstant: 100)
        boxWidthAnchor.isActive = true
        box.heightAnchor.constraint(equalToConstant: 100).isActive = true
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        box.backgroundColor = .red

        
        animator.addAnimations {
            box.backgroundColor = .blue
        }
        
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:  -100).isActive = true
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true
        
        slider.addTarget(self, action: #selector(handleSliderChanger(slider:)), for: .allEvents)
        
    }
    
    @objc fileprivate func handleSliderChanger(slider: UISlider){
        animator.fractionComplete = CGFloat(slider.value)
    }
}
