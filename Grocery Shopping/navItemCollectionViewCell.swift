//
//  navItemCollectionViewCell.swift
//  Grocery Shopping
//
//  Created by Yabby Yimer Wolle on 2/24/22.
//

import UIKit

class navItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabelView: UILabel!
    
    func cellSetup(with nav: navItem) {
        cellImageView.image = nav.img
        cellLabelView.text = nav.label
    }
}
