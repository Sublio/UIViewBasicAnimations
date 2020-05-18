//
//  ViewController.swift
//  BasicAnimations
//
//  Created by Denis Mordvinov on 17.05.2020.
//  Copyright © 2020 Denis Mordvinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let basicView = UIView()
    
    var yAnchor: NSLayoutConstraint!
    var widthAnchor: NSLayoutConstraint!
    var heightAnchor: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = DMAnimatedButton(title: "Denis")
        view.addSubview(button)
        
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        
//        basicView.backgroundColor = .blue
//        basicView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(basicView)
//        yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        yAnchor.isActive = true
//        basicView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
//        widthAnchor = basicView.heightAnchor.constraint(equalToConstant: 200)
//        widthAnchor.isActive = true
//        heightAnchor = basicView.widthAnchor.constraint(equalToConstant: 200)
//        heightAnchor.isActive = true
//
//        perform(#selector(animateBox), with: nil, afterDelay: 1)
//
//        basicView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animateOnTap)))
    }
    
    @objc fileprivate func animateBox(){
        
        yAnchor.isActive = false

        yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
        yAnchor.isActive = true
        
        
        
//        widthAnchor.isActive = false
//
//        widthAnchor = basicView.widthAnchor.constraint(equalToConstant: 100 )
//        widthAnchor.isActive = true


//        heightAnchor.isActive = false
//
//        heightAnchor = basicView.heightAnchor.constraint(equalToConstant: view.frame.height - 50 )
//        widthAnchor.isActive = true
       



        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
         })
    }
    
    var tapped: Bool = false
    
    @objc func animateOnTap(){
        
        if tapped {
            
            widthAnchor.isActive = false
            widthAnchor = basicView.widthAnchor.constraint(equalToConstant: view.frame.width/2)
            widthAnchor.isActive = true
            
            
        }else {
            
            yAnchor.isActive = false
            yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
            yAnchor.isActive = true
                   
            widthAnchor.isActive = false
            widthAnchor = basicView.widthAnchor.constraint(equalToConstant: view.frame.width - 20)
            widthAnchor.isActive = true
                   
            heightAnchor.isActive = false
            heightAnchor = basicView.heightAnchor.constraint(equalToConstant: 200)
            heightAnchor.isActive = true
        }
        
        self.tapped = !tapped
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
                   self.view.layoutIfNeeded()
                })
    }
}

