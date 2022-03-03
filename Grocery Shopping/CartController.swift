//
//  CartController.swift
//  Grocery Shopping
//
//  Created by Macky Cisse on 3/1/22.
//

import UIKit

class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var increaseBtn: UIButton!
    @IBOutlet weak var decreaseBtn: UIButton!
    var titles: [String] = []
    var sectionCount: [Int] = []
    
    @IBOutlet weak var tableView: UITableView!
    var passedIndex = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }

    func setUpGroceryUI() {

    }
    
    @IBAction func increaseClicked(_ sender: UIButton) {
        
    }
    @IBAction func decreaseClicked(_ sender: UIButton) {
        
    }
    
    /* Populating table */
    func numberOfSections(in tableView: UITableView) -> Int {
        for i in myCart {
            if !(titles.contains(i.category)) {
                titles.append(i.category)
            }
        }
        return titles.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        for x in titles {
            for i in myCart {
                if i.category == x {
                    count+=1
                }
            }
            sectionCount.append(count)
            count = 0
        }
        return sectionCount[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cartItemCell", for: indexPath) as? cartItemCell {
            cell.cellSetup(with: myCart[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

class cartItem {
    var category: String
    var label: String
    var subtotal: Double
    var quantity: Int
    
    
    init(category: String, label: String, subtotal: Double, quantity: Int) {
        self.category = category
        self.label = label
        self.subtotal = subtotal
        self.quantity = quantity
    }
}

let myCart: [cartItem] = [
    cartItem(category: "Grocery", label: "Tomatoes, per lb.", subtotal: 2.49, quantity: 2),
     cartItem(category: "Grocery", label: "Bananas, per lb.", subtotal: 0.49, quantity: 2),
     cartItem(category: "Grocery", label: "Milk", subtotal: 4.99, quantity: 1),
    cartItem(category: "Movies", label: "Milk", subtotal: 4.99, quantity: 1)
]
