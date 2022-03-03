//
//  cartItemCell.swift
//  Grocery Shopping
//
//  Created by Yabby Yimer Wolle on 2/28/22.
//

import UIKit

class cartItemCell: UITableViewCell {

    @IBOutlet weak var decrease: UIButton!
    @IBOutlet weak var increase: UIButton!
    @IBOutlet weak var subtotal: UILabel!
    @IBOutlet weak var cartLabel: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func increaseClicked(_ sender: UIButton) {
        
    }
    @IBAction func decreaseClicked(_ sender: UIButton) {
    }
    func cellSetup(with c: cartItem) {
        cartLabel.text = c.label
        subtotal.text = "$\(c.subtotal)"
        quantity.text = "\(c.quantity)"
        cartLabel.layer.cornerRadius = 16
    }

}
