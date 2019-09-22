//
//  UIColor+Random.swift
//  Stack2
//
//  Created by Кирилл Володин on 10/09/2019.
//  Copyright © 2019 Кирилл Володин. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
    
}
