//
//  AppDelegate.swift
//  HomeWork
//
//  Created by Kolya on 09/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    enum Stage: String {
        case launching
        case terminating
        
        var description: String {
            get {
                return self.rawValue.capitalized + " stage --> "
            }
        }
    }
    
    // MARK: UIApplication Lifecycle
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print(Stage.launching.description + #function)
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(Stage.launching.description + #function)
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print(Stage.launching.description + #function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print(Stage.launching.description + #function)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print(Stage.terminating.description + #function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print(Stage.terminating.description + #function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print(Stage.terminating.description + #function)
    }
    
}

