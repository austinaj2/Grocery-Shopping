//
//  CartController.swift
//  Grocery Shopping
//
//  Created by Macky Cisse on 3/1/22.
//

import UIKit

class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var emptyBtn: UIButton!
    
    var titles: [String] = []
    var sectionCount: [Int] = []
    var sectionArr: [cartItem] = []
    var sectionAofA: [[cartItem]] = []
    
    @IBOutlet weak var tableView: UITableView!
    var passedIndex = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        var sum = 0.0
        var quantSum = 0
        for i in myCart {
            sum += i.subtotal
            quantSum += i.quantity
        }
        let total = Double(round(100 * sum) / 100)
        totalLabel.text = "$\(total)              \(quantSum)"

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
                    sectionArr.append(i)
                }
            }
            sectionAofA.append(sectionArr)
            sectionArr = []
            sectionCount.append(count)
            count = 0
        }
        return sectionCount[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cartItemCell", for: indexPath) as? cartItemCell {
            cell.cellSetup(with: sectionAofA[indexPath.section][indexPath.row])
            var c = 0
            for i in myCart {
                if i.label == sectionAofA[indexPath.section][indexPath.row].label {
                    cell.decrease.tag = c
                    cell.increase.tag = c
                }
                c += 1
            }
            cell.decrease.addTarget(self, action: #selector(decreaseAction), for: .touchUpInside)
            cell.increase.addTarget(self, action: #selector(increaseAction), for: .touchUpInside)
            return cell
        }
        return UITableViewCell()
    }
    @objc func decreaseAction(sender: UIButton) {
        myCart[sender.tag].quantity -= 1
        myCart[sender.tag].subtotal = Double(myCart[sender.tag].quantity)*myCart[sender.tag].origPrice
        if myCart[sender.tag].quantity == 0 {
            myCart.remove(at: sender.tag)
        }
        tableView.reloadData()
    }
    @objc func increaseAction(sender: UIButton) {
        myCart[sender.tag].quantity += 1
        myCart[sender.tag].subtotal = Double(myCart[sender.tag].quantity)*myCart[sender.tag].origPrice
        tableView.reloadData()
    }
}

class cartItem {
    var category: String
    var label: String
    var subtotal: Double
    var quantity: Int
    var origPrice: Double
    
    
    init(origPrice: Double, category: String, label: String, quantity: Int) {
        self.origPrice = origPrice
        self.category = category
        self.label = label
        self.subtotal = origPrice*Double(quantity)
        self.quantity = quantity
    }
}

var myCart: [cartItem] = [
    cartItem(origPrice: 2.49, category: "Grocery", label: "Tomatoes, per lb.", quantity: 2),
     cartItem(origPrice: 0.49, category: "Grocery", label: "Bananas, per lb.", quantity: 2),
    cartItem(origPrice: 4.99, category: "Grocery", label: "Milk", quantity: 1),
    cartItem(origPrice: 1.99, category: "Movies", label: "Shawshank Redemption", quantity: 1),
    cartItem(origPrice: 1.99, category: "Movies", label: "Titanic", quantity: 1)
]
