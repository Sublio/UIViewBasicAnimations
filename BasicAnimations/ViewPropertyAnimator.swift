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
    
    fileprivate var imageView: UIImageView = UIImageView(image: UIImage(named: "background_picture"))
    fileprivate var blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
        
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(blurView)
        imageView.frame = view.frame
        
        imageView.contentMode = .scaleAspectFill
        blurView.frame = view.frame
        self.blurView.alpha = 0.5
        animator.addAnimations {
            self.blurView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }

        
      setupSlider()
        
    }
    
    @objc fileprivate func handleSliderChanger(slider: UISlider){
        animator.fractionComplete = CGFloat(slider.value)
        
    }
    
    fileprivate func setupSlider(){
        let slider = UISlider()
            slider.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(slider)
            slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -100).isActive = true
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true
            
            slider.addTarget(self, action: #selector(handleSliderChanger(slider:)), for: .allEvents)
    }
}
