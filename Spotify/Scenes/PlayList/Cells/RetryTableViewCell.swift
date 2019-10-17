//
//  RetryTableViewCell.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit

class RetryTableViewCell: UITableViewCell, NetworkErrorAwareProtocol {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var retryBtn: UIButton!
    
    var mode: WaitingMode = .wait
    var searcher: SearcherDelegate?
    
    func configure(mode: WaitingMode) {
        self.mode = mode
        switch mode {
        case .retry:
            indicator.stopAnimating()
            indicator.isHidden = true
            retryBtn.isHidden = false
        case .wait:
            indicator.startAnimating()
            indicator.isHidden = false
            retryBtn.isHidden = true
        }
    }
    
    func getMode() -> WaitingMode {
        return mode
    }
    
    @IBAction func retry(_ sender: UIButton) {
        configure(mode: .wait)
        searcher?.performSearch()
    }
}
