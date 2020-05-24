//
//  ViewPropertyAnimator.swift
//  BasicAnimations
//
//  Created by Denis Mordvinov on 18.05.2020.
//  Copyright © 2020 Denis Mordvinov. All rights reserved.
//

import Foundation
import UIKit

class ViewPropertyAnimator: UIViewController {

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
        //setupCAKeyFrame()
        blurView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        //perform(#selector(shake), with: nil, afterDelay: 4)

        setupUIViewAnimateKeyFrame()

    }

    fileprivate func setupUIViewAnimateKeyFrame() {

        let center = self.imageView.center

        UIView.animateKeyframes(withDuration: 8, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.3) {
                self.imageView.center = CGPoint(x: center.x + 100, y: center.y + 100)
                       }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
                           self.imageView.center = CGPoint(x: center.x - 100, y: center.y - 100)
                       }
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.4) {
                           self.imageView.center = CGPoint(x: center.x + 100, y: center.y - 100)
                       }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3) {
                                      self.imageView.center = center
                                  }
        })
    }

    @objc fileprivate func shake() {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.values = [
            CGPoint(x: 0, y: 0),
            CGPoint(x: -20, y: -20),
            CGPoint(x: 20, y: 20),
            CGPoint(x: -10, y: -10),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 0, y: 0),
            CGPoint(x: -10, y: -10)
        ]
        animation.keyTimes = [
            0, 0.1, 0.25, 0.4, 0.6, 0.8, 1
        ]

        animation.duration = 0.5
        animation.isAdditive = true
        animation.repeatCount = 10
        blurView.layer.add(animation, forKey: "shakeAnimation")
    }

    fileprivate func setupCAKeyFrame() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.scale"
        animation.values = [0.5, 1, 0.5, 0.75]
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = 2
        blurView.layer.add(animation, forKey: "transforscale")

        let colorAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
        colorAnimation.values = [
            UIColor.cyan.cgColor,
            UIColor.red.cgColor,
            UIColor.green.cgColor
        ]
        colorAnimation.keyTimes = [0, 0.5, 1]
        colorAnimation.duration = 1

        blurView.layer.add(colorAnimation, forKey: "bgcolor")
    }

    fileprivate func setupCGradientLayer() {

        let gradient = CAGradientLayer()
        gradient.frame = blurView.frame
        gradient.colors = [UIColor.red.cgColor, UIColor.cyan.cgColor]
        gradient.locations = [0.1, 0.2]
        blurView.layer.addSublayer(gradient)
    }

    fileprivate func setupCABasic() {
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

    @objc fileprivate func handleSliderChanger(slider: UISlider) {
        animator.fractionComplete = CGFloat(slider.value)

    }

    fileprivate func setupSlider() {
        let slider = UISlider()
            slider.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(slider)
            slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true

            slider.addTarget(self, action: #selector(handleSliderChanger(slider:)), for: .allEvents)
    }
}
