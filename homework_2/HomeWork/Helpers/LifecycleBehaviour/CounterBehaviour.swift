//
//  CounterBehaviour.swift
//  HomeWork
//
//  Created by Kolya on 15/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

class CounterBehavour: ViewControllerLifecycleBehavior {
    private var timer: Timer?
    
    // MARK: View Controller Lifecycle behaviour
    
    func beforeAppearing(_ viewController: UIViewController) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        timer?.invalidate()
    }
    
    // MARK: Pivate
    @objc private func runTimed() {
        print(Date())
    }
}
