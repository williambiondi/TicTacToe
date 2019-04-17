//
//  CustomButtons.swift
//  TicTacToe
//
//  Created by William Biondi on 17/04/2019.
//  Copyright © 2019 William Biondi. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var cornerRadius : CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable var borderWidth : CGFloat{
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor : UIColor?{
        get{
            if let color = layer.borderColor{
                return UIColor(cgColor: color)
            }
            return nil
        }
        set{
            if let color = newValue{
                layer.borderColor = color.cgColor
            }
            else{
                layer.borderColor = nil
            }
            
        }
    }
    
}
