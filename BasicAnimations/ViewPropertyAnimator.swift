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
        imageView.layer.masksToBounds = true
        animator.addAnimations {
            self.blurView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5 )
        }

//        setupCGradientLayer()
//        setupCAKeyFrame()
//        setupCABasic()
//        setupSlider()
        setupCAKeyFrame()

    }
    
    fileprivate func setupCAKeyFrame(){
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.scale"
        animation.values = [0.5, 1, 0.5, 0.75]
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = 2
        blurView.layer.add(animation, forKey: "transforscale")
    }
    
    fileprivate func setupCGradientLayer(){
        
        let gradient = CAGradientLayer()
        gradient.frame = blurView.frame
        gradient.colors = [UIColor.red.cgColor, UIColor.cyan.cgColor]
        gradient.locations = [0.1, 0.2]
        blurView.layer.addSublayer(gradient)
    }
    
    fileprivate func setupCABasic(){
        let basic0 = CABasicAnimation(keyPath: "transform.scale")
        basic0.toValue = 0.5
        basic0.duration = 2
        basic0.fillMode = CAMediaTimingFillMode.forwards
        basic0.isRemovedOnCompletion = false
        imageView.layer.add(basic0, forKey: "denis")
        blurView.layer.add(basic0, forKey: "denis")
        
        let basic1 = CABasicAnimation(keyPath: "cornerRadius")
            basic1.toValue = 50
            basic1.duration = 2
            basic1.fillMode = CAMediaTimingFillMode.forwards
            basic1.isRemovedOnCompletion = false
            imageView.layer.add(basic1, forKey: "Denis")
            //blurView.layer.add(basic1, forKey: "denis")
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
