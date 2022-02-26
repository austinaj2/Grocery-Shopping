//
//  groceryListTVController.swift
//  Grocery Shopping
//
//  Created by Macky Cisse on 2/25/22.
//

import UIKit

class groceryListTVController: UITableViewController {
    
    @IBOutlet weak var cartBarButton: UIBarButtonItem!
    let cartImg = UIImage(named: "navCart")
    let cartBtn = UIButton()
    var passedIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

    }

    func setUpUI() {
        cartBtn.setImage(cartImg, for: .normal)
        cartBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        cartBtn.sizeToFit()
        navigationItem.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartBtn)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
