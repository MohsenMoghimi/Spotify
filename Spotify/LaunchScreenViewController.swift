//
//  ViewController.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/16/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit
import SpotifyLogin

class LaunchScreenViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        containerView.center.y -= UIScreen.main.bounds.height
        logo.center.y -= UIScreen.main.bounds.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateView()
    }
    
    fileprivate func animateView() {
        UIView.animate(withDuration: 0.1) {
            self.containerView.center.y += UIScreen.main.bounds.height
        }
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
            self.logo.center.y += UIScreen.main.bounds.height
        }) { (true) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: { [weak self] in
                self?.goToContainetr()
                UIView.animate(withDuration: 1) {
                    self?.containerView.center.y -= UIScreen.main.bounds.height
                }
            })
        }
    }
    
    fileprivate func goToContainetr() {
        self.performSegue(withIdentifier: "goToContainetr", sender: nil)
    }
}


