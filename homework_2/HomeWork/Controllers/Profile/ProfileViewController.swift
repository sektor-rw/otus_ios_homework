//
//  ProfileViewController.swift
//  HomeWork
//
//  Created by Kolya on 15/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBehaviors(behaviors: [NavigationBarColorBehaviour()])
    }
}

