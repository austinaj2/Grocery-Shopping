//
//  OrderCell.swift
//  Grocery Shopping
//
//  Created by Yabby Yimer Wolle on 3/5/22.
//

import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var orderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func cellSetup(with orderLabels: orders) {
        orderLabel.text = "$\(orderLabels.label)"
    }
}
