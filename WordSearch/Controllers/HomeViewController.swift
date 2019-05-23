//
//  HomeViewController.swift
//  WordSearch
//
//  Created by Manan on 2019-05-07.
//  Copyright © 2019 Manan Patel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var searchGrid: SearchGridViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadUI()
    }
    
    func loadUI() {
        print("loading UI")
        
        setGradientBackground(colorTop: .purple, colorBottom: UIColor.red)
    }
    
    func startGame() {
        print("starting Game")
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

}



