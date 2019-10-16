//
//  ContainerViewController.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/16/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit
import SpotifyLogin

class ContainerViewController: UIViewController {

    fileprivate lazy var loginViewController: LoginViewController = {
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        var viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    fileprivate lazy var playListViewController: PlayListViewController = {
        let storyboard = UIStoryboard(name: "PlayListViewController", bundle: nil)
        var viewController = storyboard.instantiateViewController(withIdentifier: "PlayListViewController") as! PlayListViewController
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccessful), name: .SpotifyLoginSuccessful, object: nil)
        updateView()
    }
    
    
    fileprivate func updateView() {
        SpotifyLogin.shared.getAccessToken { [weak self] (token, error) in
            if error != nil, token == nil {
                self!.remove(asChildViewController: self!.playListViewController)
                self!.add(asChildViewController: self!.loginViewController)
            }
            if error == nil, token != nil {
                self!.remove(asChildViewController: self!.loginViewController)
                self!.add(asChildViewController: self!.playListViewController)
            }
        }
    }
    
    fileprivate func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    fileprivate func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    @objc fileprivate func loginSuccessful() {
        updateView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
