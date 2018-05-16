//
//  WFMTrackViewController.swift
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

import UIKit
import SDWebImage

class WFMTrackViewController: UIViewController {
    
    var artistName: String = ""
    var collectionCensoredName: String = ""
    var trackCensoredName: String = ""
    var artworkUrl: String = ""

    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstLabel.text = artistName
        secondLabel.text = collectionCensoredName
        thirdLabel.text = trackCensoredName
        if artworkUrl.count > 0 {
            artworkImageView.sd_setImage(with: URL(string: artworkUrl))
        }
    }
    
}
