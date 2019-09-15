//
//  ThirdViewController.swift
//  HomeWork
//
//  Created by Kolya on 15/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBAction func backToFeeds(_ sender: Any) {
        guard let currentStack = self.navigationController?.viewControllers else { return }
        self.navigationController?.setViewControllers([currentStack[0]], animated: true)
    }
    
}
