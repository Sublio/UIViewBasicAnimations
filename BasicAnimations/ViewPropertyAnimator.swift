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
        
    let box = UIView()
    
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
            self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5 )
        }

        
        setupSlider()
        
        box.backgroundColor = .red
        box.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(box)
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        box.widthAnchor.constraint(equalToConstant: 150).isActive = true
        box.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        perform(#selector(self.animateBox), with: nil, afterDelay: 1)
        
        
        
    }
    
    @objc fileprivate func animateBox(){
        UIView.animate(withDuration: 0.3, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            var transform = CGAffineTransform.identity
            transform = transform.scaledBy(x: 1.1, y: 1.6)
            transform = transform.translatedBy(x: 30, y: 50)
            transform = transform.rotated(by: 45)
            self.box.transform = transform
        }, completion: nil)
        
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
