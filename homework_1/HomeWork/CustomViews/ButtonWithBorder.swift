//
//  ButtonWithBorder.swift
//  HomeWork
//
//  Created by Kolya on 09/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ButtonWithBorder: UIButton {
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    override func prepareForInterfaceBuilder() {
        self.borderColor = .blue
        self.borderWidth = 2
        self.cornerRadius = 5
    }
}
