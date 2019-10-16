//
//  LoginViewController.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/16/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit
import SpotifyLogin

class LoginViewController: UIViewController {

    fileprivate var loginBtn : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    fileprivate func configButton() {
        let sptButton = SpotifyLoginButton(viewController: self, scopes: [.userReadTop, .playlistReadPrivate, .userLibraryRead])
        view.addSubview(sptButton)
        loginBtn = sptButton
        loginBtn?.center = view.center
    }
}

