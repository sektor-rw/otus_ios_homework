//
//  StatusBarColorBehaviour.swift
//  HomeWork
//
//  Created by Kolya on 15/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

struct NavigationBarState {
    let barTintColor: UIColor?
    let barStyle: UIBarStyle
    let isTranslucent: Bool
    
    static func navigationStateFrom(navBar: UINavigationBar) -> NavigationBarState {
        return NavigationBarState(barTintColor: navBar.barTintColor,
                                  barStyle: navBar.barStyle,
                                  isTranslucent: navBar.isTranslucent)
    }
    
    func applyStateForNavBar(_ navBar: UINavigationBar) {
        navBar.isTranslucent = self.isTranslucent
        navBar.barStyle = self.barStyle
        navBar.barTintColor = self.barTintColor
    }
}

class NavigationBarColorBehaviour: ViewControllerLifecycleBehavior {
    private var newBgColor: UIColor
    private let newNavigationState: NavigationBarState
    private var savedNavigationState: NavigationBarState?
    
    init(_ bgColor: UIColor = .black,
         _ navBarState: NavigationBarState = NavigationBarState(barTintColor: UIColor(white: 0.2, alpha: 1),
                                                                barStyle: .black,
                                                                isTranslucent: false)) {
        newBgColor = bgColor
        newNavigationState = navBarState
    }
    
    func beforeAppearing(_ viewController: UIViewController) {
        viewController.view.backgroundColor = self.newBgColor
        
        guard let navigationBar = viewController.navigationController?.navigationBar else { return }
        self.savedNavigationState = NavigationBarState.navigationStateFrom(navBar: navigationBar)
        self.newNavigationState.applyStateForNavBar(navigationBar)
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        guard let navigationBar = viewController.navigationController?.navigationBar else { return }
        self.savedNavigationState?.applyStateForNavBar(navigationBar)
    }
}
