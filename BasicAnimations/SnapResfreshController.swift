//
//  SnapResfreshController.swift
//  BasicAnimations
//
//  Created by Denis Mordvinov on 26.05.2020.
//  Copyright © 2020 Denis Mordvinov. All rights reserved.
//

import Foundation
import UIKit

class SnapRefreshController: UIViewController {

    fileprivate let startingHeight: CGFloat = 50
    fileprivate let shapeLayer: CAShapeLayer = CAShapeLayer()

    fileprivate let leftThree = UIView()
    fileprivate let leftTwo = UIView()
    fileprivate let leftOne = UIView()
    fileprivate let centerZero = UIView()
    fileprivate let rightOne = UIView()
    fileprivate let rightTwo = UIView()
    fileprivate let rightThree = UIView()

    fileprivate lazy var views: [UIView] = [
        leftThree,
        leftTwo,
        leftOne,
        centerZero,
        rightOne,
        rightTwo,
        rightThree
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        views.forEach {(layoutViewPoint) in
            layoutViewPoint.frame = CGRect(x: 0, y: 0, width: 4, height: 4)
            layoutViewPoint.backgroundColor = .cyan
            view.addSubview(layoutViewPoint)
        }

        shapeLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: startingHeight)
        shapeLayer.backgroundColor  = UIColor.darkGray.cgColor
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.userIsDragging)))

    }

    @objc fileprivate func userIsDragging(gesture: UIPanGestureRecognizer) {

        if gesture.state == .ended || gesture.state == .failed || gesture.state == .cancelled {

        } else {
            shapeLayer.frame.size.height = startingHeight + gesture.translation(in: self.view).y

        }
    }
}
