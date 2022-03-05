//
//  groceryItemCell.swift
//  Grocery Shopping
//
//  Created by Yabby Yimer Wolle on 2/27/22.
//

import UIKit

class groceryItemCell: UITableViewCell {

    @IBOutlet weak var gPrice: UILabel!
    @IBOutlet weak var gDescrip: UILabel!
    @IBOutlet weak var groceryName: UILabel!
    @IBOutlet weak var gImage: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    
    
    func cellSetup(with grocery: groceryItem) {
        gPrice.text = "$\(grocery.price)"
        gDescrip.text = grocery.descrip
        groceryName.text = grocery.label
        gImage.image = grocery.img
    }
    
}
