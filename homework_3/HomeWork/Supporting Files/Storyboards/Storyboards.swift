//
//  Storyboards.swift
//  HomeWork
//
//  Created by Kolya on 18/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case main
    case additional
    
    var filename: String {
        return rawValue.capitalized
    }
}
