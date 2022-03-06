//
//  NewCategoryCell.swift
//  Grocery Shopping
//
//  Created by Yabby Yimer Wolle on 3/5/22.
//

import UIKit

class NewCategoryCell: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nImage: UIImageView!
    @IBOutlet weak var addButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func cellSetup(with new: newItem) {
        let s = "$\(new.price)"
        price.text = s
        descrip.text = new.descrip
        name.text = new.label
        nImage.image = new.img
    }


}
