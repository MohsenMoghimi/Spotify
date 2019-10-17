//
//  PlayListTableViewCell.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/17/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit

class PlayListTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var album: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var albumArt: UIImageView!
    
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
    }
}
