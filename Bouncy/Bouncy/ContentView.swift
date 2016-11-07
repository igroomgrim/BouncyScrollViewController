//
//  ContentView.swift
//  Bouncy
//
//  Created by Anak Mirasing on 11/7/16.
//  Copyright © 2016 iGROOMGRiM. All rights reserved.
//

import UIKit

class ContentView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}
