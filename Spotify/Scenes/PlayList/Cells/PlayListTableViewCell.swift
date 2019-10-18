//
//  PlayListTableViewCell.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit
import Kingfisher

class PlayListTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var album: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var imageIndicator: UIActivityIndicatorView!
    
    func config(model: Items) {
        if let strName = model.name {
            name.text = strName
        }
        if let strAlbum = model.album?.name {
            album.text = strAlbum
        }
        if let artists = model.artists {
            let artistsName = artists.map({$0.name!})
            artist.text = artistsName.joined(separator: " - ")
        }
        if let images = model.album?.images {
            chooseAndSetImage(images: images, imageView: albumArt)
        }
    }
    
    func chooseAndSetImage(images: [Images], imageView: UIImageView) {
        imageIndicator.startAnimating()
        let imageUrl: String?
        if images.count > 2 {
            imageUrl = images[1].url
        } else {
            imageUrl = images.last?.url
        }
        if let imageUrl = imageUrl {
            let processor = DownsamplingImageProcessor(size: imageView.frame.size)
            let options: [KingfisherOptionsInfoItem] = [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.3))
            ]
            imageView.kf.setImage(
                with: URL(string: imageUrl),
                placeholder: UIImage(named: "placeholder"),
                options: options)
            imageIndicator.stopAnimating()
        } else {
            imageView.image = UIImage(named: "placeholder")
            imageIndicator.stopAnimating()
        }
    }
}
