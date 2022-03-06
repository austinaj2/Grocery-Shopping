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
    var ip = IndexPath()
    
    var titles: [String] = []
    var sectionCount: [Int] = []
    var sectionArr: [cartItem] = []
    var sectionAofA: [[cartItem]] = []
    var sum = 0.0
    var quantSum = 0
    var totBuy = 0.0
    
    @IBOutlet weak var tableView: UITableView!
    var passedIndex = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        totalLabel.text = total()
        emptyBtn.tintColor = UIColor.red
        buyBtn.tintColor = UIColor.systemGreen
    }

    @IBAction func buyAction(_ sender: Any) {
        let s = total()
        print(s)
        let arr = s.split(separator: " ")
        var tot = String()
        for i in arr[0] {
            if i != "$" {
                tot += String(i)
            }
        }
        totBuy = Double(tot)!
        let alert = UIAlertController(title: "Confirm Purchase", message: "Your card will be charged $\(totBuy).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("Purchase cancelled.")
        }))
        alert.addAction(UIAlertAction(title: "Place Order", style: .default, handler: { action in
            print("Bought.")
            self.buyIt(q: Int(arr[1])!)
            myCart.removeAll()
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
        
    }
    
    func buyIt(q: Int) {
        if ordersItems.count < 10 {
            ordersItems.append(orders(items: q, tot: totBuy, date: Date()))
        }
        else {
            ordersItems.remove(at: 0)
        }
    }
    
    @IBAction func emptyAction(_ sender: Any) {
        let alert = UIAlertController(title: "Emptying cart", message: "Are you sure you want to emnpty your cart?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("Purchase cancelled.")
        }))
        alert.addAction(UIAlertAction(title: "Empty", style: .default, handler: { action in
            print("Emptied.")
            myCart.removeAll()
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    
    func total() -> String {
        for i in myCart {
            sum += i.subtotal
            quantSum += i.quantity
        }
        let total = Double(round(100 * sum) / 100)
        let pass = "  $\(total)              \(quantSum)"
        quantSum = 0; sum = 0.0
        return pass
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
            ip = indexPath
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
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if (sectionAofA[indexPath.section][indexPath.row].quantity) == 0 {
//            sectionAofA.remove(at: [indexPath.section][indexPath.row])
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }
    
    @objc func decreaseAction(sender: UIButton) {
        myCart[sender.tag].quantity -= 1
        let sub = Double(myCart[sender.tag].quantity)*myCart[sender.tag].origPrice
        myCart[sender.tag].subtotal = Double(round(100 * sub) / 100)
        if myCart[sender.tag].quantity == 0 {
            tableView.beginUpdates()
            myCart[sender.tag].label = "----------"
            myCart.remove(at: sender.tag)
            tableView.reloadData()
            tableView.endUpdates()
            let alert = UIAlertController(title: "Item Deleted!", message: "Please do not click again, cart will update on return.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
                print("Item deleted.")
            }))
            present(alert, animated: true)
        }
        tableView.reloadData()
        totalLabel.text = total()
        
    }
    
    @objc func increaseAction(sender: UIButton) {
        myCart[sender.tag].quantity += 1
        let sub = Double(myCart[sender.tag].quantity)*myCart[sender.tag].origPrice
        myCart[sender.tag].subtotal = Double(round(100 * sub) / 100)
        tableView.reloadData()
        totalLabel.text = total()
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
        let t = origPrice*Double(quantity)
        let total = Double(round(100 * t) / 100)
        self.subtotal = total
        self.quantity = quantity
    }
    
    init() {
        self.origPrice = 0
        self.category = ""
        self.label = ""
        self.subtotal = 0.0
        self.quantity = 0
    }
}

var myCart: [cartItem] = [
    cartItem(origPrice: 2.49, category: "Grocery", label: "Tomatoes, per lb.", quantity: 2),
     cartItem(origPrice: 0.49, category: "Grocery", label: "Bananas, per lb.", quantity: 2),
    cartItem(origPrice: 4.99, category: "Grocery", label: "Milk", quantity: 1),
    cartItem(origPrice: 1.99, category: "Movies", label: "Shawshank Redemption", quantity: 1),
    cartItem(origPrice: 1.99, category: "Movies", label: "Titanic", quantity: 1)
]
