//
//  groceryListTVController.swift
//  Grocery Shopping
//
//  Created by Macky Cisse on 2/25/22.
//

import UIKit

class DetailController: UITableViewController {
    
    @IBOutlet weak var cartBarButton: UIBarButtonItem!
    let cartButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    var passedIndex = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setUpGroceryUI()
    }

    func setUpGroceryUI() {
        cartButton.setImage(UIImage(named: "navCart")?.withRenderingMode(.alwaysOriginal), for: .normal)
        navigationItem.setRightBarButton(UIBarButtonItem(customView: cartButton), animated: true)
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "groceryItemCell", for: indexPath) as? groceryItemCell {
            
            cell.cellSetup(with: groceries[indexPath.row])
            return cell
        }
        return UITableViewCell()
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

/* Initializing items */

let groceries: [groceryItem] = [
    groceryItem(img: UIImage(named: "bananas")!, label: "Bananas, per lb.", price: 0.49, descrip: "Very durable."),
    groceryItem(img: UIImage(named: "tomatoes")!, label: "Tomatoes, per lb.", price: 2.45, descrip: "On the vine."),
    groceryItem(img: UIImage(named: "gala")!, label: "Apples, per lb.", price: 1.47, descrip: "Gala apples."),
    groceryItem(img: UIImage(named: "lettuce")!, label: "Lettuce, per lb.", price: 3.19, descrip: "Green leaf lettuce."),
    groceryItem(img: UIImage(named: "broccoli")!, label: "Broccoli, per lb.", price: 1.99, descrip: "A bunch."),
    groceryItem(img: UIImage(named: "bread")!, label: "Bread", price: 2.32, descrip: "Whole-wheat."),
    groceryItem(img: UIImage(named: "milk")!, label: "Milk", price: 4.99, descrip: "One box, organic."),
    groceryItem(img: UIImage(named: "eggs")!, label: "Eggs", price: 0.98, descrip: "By the dozen."),
]
