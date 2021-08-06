//
//  ViewControllersFactrory.swift
//  UIBank
//
//  Created by Silence on 25.07.2021.
//


import UIKit

class ViewControllersFactory {
    private static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func viewController<T: UIViewController>(identifier: String) -> T {
        ViewControllersFactory.storyboard.instantiateViewController(identifier: identifier) as! T
    }
}
