//
//  UIViewController+Alert.swift
//  HomeWork
//
//  Created by Nick on 22/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

extension UIViewController {
    @objc func showAlert(_ title:String, message:String, textBtn:String) {
        let alertView = UIAlertController(title: title,
                                          message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: textBtn, style: .destructive, handler: nil)
        alertView.addAction(OKAction)
        self.present(alertView, animated: false, completion: nil)
    }
    
    func showAlert(_ title:String, message:String, style:UIAlertController.Style, actions: [(String, UIAlertAction.Style, ()->())]) {
        let alertView = UIAlertController(title: title,
                                          message: message, preferredStyle: style)
        
        actions.forEach {
            let act = $0.2
            alertView.addAction(UIAlertAction(title: $0.0, style: $0.1) {_ in act() } )
        }
        
        self.present(alertView, animated: true, completion: nil)
    }
    
    func showAlert(_ title:String, message:String, actions: [UIAlertAction]) {
        let alertView = UIAlertController(title: title,
                                          message: message, preferredStyle: .alert)
        
        actions.forEach {
            alertView.addAction($0)
        }
        
        self.present(alertView, animated: true, completion: nil)
    }
    
    func alert(_ title:String, message:String, textBtn:String) -> UIAlertController {
        let alertView = UIAlertController(title: title,
                                          message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: textBtn, style: .destructive, handler: nil)
        alertView.addAction(OKAction)
        return alertView
    }
}
