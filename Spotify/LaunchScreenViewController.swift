//
//  ViewController.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/16/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit

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
        UIView.animate(withDuration: 0.1) {
            self.containerView.center.y += UIScreen.main.bounds.height
        }
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
            self.logo.center.y += UIScreen.main.bounds.height
        }) { (true) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                self.performSegue(withIdentifier: "next", sender: nil)
                UIView.animate(withDuration: 1) {
                    self.containerView.center.y -= UIScreen.main.bounds.height
                }
            })
        }
    }
}

