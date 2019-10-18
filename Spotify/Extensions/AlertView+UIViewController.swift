//
//  AlertView+UIViewController.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/18/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(with title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
