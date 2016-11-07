//
//  BGView.swift
//  Bouncy
//
//  Created by Anak Mirasing on 11/7/16.
//  Copyright © 2016 iGROOMGRiM. All rights reserved.
//

import UIKit

class BGView: UIView {
    init(frame: CGRect, colors: [UIColor]) {
        super.init(frame: frame)
        setup(colors: colors)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(colors: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(colors: nil)
    }
    
    func setup(colors: [UIColor]?) {
        guard let colors = colors else {
            print("colors is nil")
            return
        }
        
        let leftShapeLayer = CAShapeLayer()
        leftShapeLayer.path = createLeftPath().cgPath
        leftShapeLayer.fillColor = colors[0].cgColor
        
        let rightShapeLayer = CAShapeLayer()
        rightShapeLayer.path = createRightPath().cgPath
        rightShapeLayer.fillColor = colors[1].cgColor
        
        self.layer.addSublayer(leftShapeLayer)
        self.layer.addSublayer(rightShapeLayer)
    }
    
    func createLeftPath() -> UIBezierPath {
        let leftPath = UIBezierPath()
        leftPath.move(to: CGPoint(x: 0, y: 0))
        leftPath.addLine(to: CGPoint(x: self.frame.width, y: 0))
        leftPath.addLine(to: CGPoint(x: 0, y: self.frame.height))
        leftPath.addLine(to: CGPoint(x: 0, y: 0))
        leftPath.close()
        
        return leftPath
    }
    
    func createRightPath() -> UIBezierPath {
        let rightPath = UIBezierPath()
        rightPath.move(to: CGPoint(x: self.frame.width, y: 0))
        rightPath.addLine(to: CGPoint(x: self.frame.width * 2.0, y: 0))
        rightPath.addLine(to: CGPoint(x: self.frame.width * 2.0, y: self.frame.height))
        rightPath.addLine(to: CGPoint(x: 0, y: self.frame.height))
        rightPath.addLine(to: CGPoint(x: self.frame.width, y: 0))
        rightPath.close()
        
        return rightPath
    }
}
