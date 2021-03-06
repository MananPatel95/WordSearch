//
//  UIViewController+Extensions.swift
//  WordSearch
//
//  Created by Manan on 2019-05-10.
//  Copyright © 2019 Manan Patel. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideNavigationBar(){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func showNavigationBar() {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
