//
//  ButtonStyle.swift
//  TicTacToe
//
//  Created by William Biondi on 17/04/2019.
//  Copyright © 2019 William Biondi. All rights reserved.
//

import Foundation
import UIKit

@IBInspectable var cornerRadius: CGFloat = 15 {
    didSet {
        refreshCorners(value: cornerRadius)
    }
}

@IBDesignable class buttonStyle : UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
}
