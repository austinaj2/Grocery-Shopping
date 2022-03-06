//
//  groceryListTVController.swift
//  Grocery Shopping
//
//  Created by Macky Cisse on 2/25/22.
//

import UIKit

class DetailController: UITableViewController {
    
    @IBOutlet weak var cartBarButton: UIBarButtonItem!
    // let cartButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let labelHolder = UILabel(frame: CGRect(x: 5, y: 0, width: 40, height: 40))
    var passedIndex = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setUpGroceryUI()
    }

    func setUpGroceryUI() {
        let cartButton = UIButton(type: .custom)
        cartButton.setImage(UIImage(named: "navCart")?.withRenderingMode(.alwaysOriginal), for: .normal)
        cartButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        cartButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        var cartLabel = myCart.count
        labelHolder.text = "\(cartLabel)"
        labelHolder.textAlignment = .center
        labelHolder.backgroundColor = UIColor.clear
        labelHolder.textColor = UIColor.black
        cartButton.addSubview(labelHolder)
        navigationItem.setRightBarButton(UIBarButtonItem(customView: cartButton), animated: true)
    }
    
    @objc func goToCart(sender: UIButton) {
        if let next = self.storyboard?.instantiateViewController(withIdentifier: "CartController") as? CartController {
            next.title = "Your Cart"
            self.navigationController?.pushViewController(next, animated: true)
        }
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.title == "Grocery" {
            return groceries.count
        }
        if self.title == "Movies" {
            return movies.count
        }
        if self.title == "Garden" {
            return gardening.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.title == "Grocery" {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "groceryItemCell", for: indexPath) as? groceryItemCell {
                cell.groceryCellSetup(with: groceries[indexPath.row])
                cell.addButton.tag = indexPath.row
                cell.addButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
                return cell
            }
        }
        if self.title == "Movies" {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "groceryItemCell", for: indexPath) as? groceryItemCell {
                cell.movieCellSetup(with: movies[indexPath.row])
                cell.addButton.tag = indexPath.row
                cell.addButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
                return cell
            }
        }
        if self.title == "Garden" {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "groceryItemCell", for: indexPath) as? groceryItemCell {
                cell.gardenCellSetup(with: gardening[indexPath.row])
                cell.addButton.tag = indexPath.row
                cell.addButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    @objc func addItem(sender: UIButton) {
        var toggle = true
        for i in myCart {
            if self.title == "Grocery" {
                if i.label == groceries[sender.tag].label {
                    toggle = false
                    i.quantity += 1
                    i.subtotal = Double(i.quantity)*i.origPrice
                }
            }
            if self.title == "Garden" {
                if i.label == gardening[sender.tag].label {
                    toggle = false
                    i.quantity += 1
                    i.subtotal = Double(i.quantity)*i.origPrice
                }
            }
            if self.title == "Movies" {
                if i.label == movies[sender.tag].label {
                    toggle = false
                    i.quantity += 1
                    i.subtotal = Double(i.quantity)*i.origPrice
                }
            }
        }
        if toggle == true {
            if self.title == "Grocery" {
                myCart.append(cartItem(origPrice: groceries[sender.tag].price, category: self.title ?? "", label: groceries[sender.tag].label, quantity: 1))
            }
            if self.title == "Garden" {
                myCart.append(cartItem(origPrice: gardening[sender.tag].price, category: self.title ?? "", label: gardening[sender.tag].label, quantity: 1))
            }
            if self.title == "Movies" {
                myCart.append(cartItem(origPrice: movies[sender.tag].price, category: self.title ?? "", label: movies[sender.tag].label, quantity: 1))
            }
        }
        labelHolder.text = "\(myCart.count)"
        tableView.reloadData()
    }
}

/* Setting up classes for pages */
class groceryItem {
    var img: UIImage
    var label: String
    var price: Double
    var descrip: String
    
    init(img: UIImage, label: String, price: Double, descrip: String) {
        self.img = img
        self.label = label
        self.price = price
        self.descrip = descrip
    }
}

class gardenItem {
    var img: UIImage
    var label: String
    var price: Double
    var descrip: String
    
    init(img: UIImage, label: String, price: Double, descrip: String) {
        self.img = img
        self.label = label
        self.price = price
        self.descrip = descrip
    }
}

class movieItem {
    var img: UIImage
    var label: String
    var price: Double
    var descrip: String
    
    init(img: UIImage, label: String, price: Double, descrip: String) {
        self.img = img
        self.label = label
        self.price = price
        self.descrip = descrip
    }
}


/* Initializing items */
var groceries: [groceryItem] = [
    groceryItem(img: UIImage(named: "bananas")!, label: "Bananas, per lb.", price: 0.49, descrip: "Very durable."),
    groceryItem(img: UIImage(named: "tomatoes")!, label: "Tomatoes, per lb.", price: 2.45, descrip: "On the vine."),
    groceryItem(img: UIImage(named: "gala")!, label: "Apples, per lb.", price: 1.47, descrip: "Gala apples."),
    groceryItem(img: UIImage(named: "lettuce")!, label: "Lettuce, per lb.", price: 3.19, descrip: "Green leaf lettuce."),
    groceryItem(img: UIImage(named: "broccoli")!, label: "Broccoli, per lb.", price: 1.99, descrip: "A bunch."),
    groceryItem(img: UIImage(named: "bread")!, label: "Bread", price: 2.32, descrip: "Whole-wheat."),
    groceryItem(img: UIImage(named: "milk")!, label: "Milk", price: 4.99, descrip: "One box, organic."),
    groceryItem(img: UIImage(named: "eggs")!, label: "Eggs", price: 0.98, descrip: "By the dozen."),
]

var movies: [movieItem] = [
    movieItem(img: UIImage(named: "shawshank")!, label: "Shawshank Redemption", price: 0.49, descrip: "Great plot."),
    movieItem(img: UIImage(named: "lord-of-the-rings")!, label: "Lord of the Rings", price: 2.45, descrip: "Bron need 5 rings."),
    movieItem(img: UIImage(named: "godfather")!, label: "Godfather", price: 1.47, descrip: "Longest movie ever...")
]

var gardening: [gardenItem] = [
    gardenItem(img: UIImage(named: "shovel")!, label: "Shovel", price: 10.49, descrip: "Very durable."),
    gardenItem(img: UIImage(named: "tomato-plant")!, label: "Tomato plant", price: 2.45, descrip: "On the vine."),
    gardenItem(img: UIImage(named: "mower")!, label: "Mower", price: 1.47, descrip: "Very sturdy."),
    gardenItem(img: UIImage(named: "garden-soil")!, label: "Garden Soil", price: 20.19, descrip: "Fertilized"),
    gardenItem(img: UIImage(named: "fruit-tree")!, label: "Fruit tree", price: 1.99, descrip: "A bunch."),
    gardenItem(img: UIImage(named: "leaves-rake")!, label: "Rake", price: 14.49, descrip: "For leaves.")
]
