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
    
    
    
    
    func groceryCellSetup(with grocery: groceryItem) {
        gPrice.text = "$\(grocery.price)"
        gDescrip.text = grocery.descrip
        groceryName.text = grocery.label
        gImage.image = grocery.img
    }
    func gardenCellSetup(with g: gardenItem) {
        gPrice.text = "$\(g.price)"
        gDescrip.text = g.descrip
        groceryName.text = g.label
        gImage.image = g.img
    }
    func movieCellSetup(with m: movieItem) {
        gPrice.text = "$\(m.price)"
        gDescrip.text = m.descrip
        groceryName.text = m.label
        gImage.image = m.img
    }
    
}
