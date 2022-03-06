//
//  NewTVC.swift
//  Grocery Shopping
//
//  Created by Yabby Yimer Wolle on 3/5/22.
//

import UIKit

class NewTVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var categoryNew: UITextField!
    @IBOutlet weak var warning: UILabel!
    @IBOutlet weak var nameNew: UITextField!
    @IBOutlet weak var imageNew: UIImageView!
    @IBOutlet weak var priceNew: UITextField!
    @IBOutlet weak var desNew: UITextField!
    var impImage = UIImage()
    var i = newItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        if tableView.numberOfRows(inSection: 0) == 0 {
            message.text = "No items created! Click below to create one"
            message.textColor = .gray
        }
        else {
            message.text = ""
        }
        warning.text = ""
        warning.textColor = .red
        imageNew.image = UIImage()

    }
    
    @IBAction func addImageClicked(_ sender: Any) {
        imageBtnClicked()
    }
    @IBAction func newItemClicked(_ sender: Any) {
        if nameNew.hasText && desNew.hasText && priceNew.hasText && categoryNew.hasText {
            i.label = nameNew.text!
            i.descrip = desNew.text!
            i.category = categoryNew.text!
            var inCategories = false
            for x in navItems {
                if x.label.lowercased() == i.category.lowercased() {
                    print(x.label)
                    print(i.category)
                    inCategories = true
                }
            }
            if let p = Double(priceNew.text!) {
                if imageNew.image != UIImage()  {
                    i.price = p
                    i.img = imageNew.image!
                    newItems.append(i)
                    nameNew.text = ""
                    desNew.text = ""
                    categoryNew.text = ""
                    priceNew.text = ""
                    warning.text = ""
                    imageNew.image = UIImage()
                    self.tableView.reloadData()
                    if i.category.lowercased() == "Grocery".lowercased() {
                        groceries.append(groceryItem(img: i.img, label: i.label, price: i.price, descrip: i.descrip))
                    }
                    if i.category.lowercased() == "Garden".lowercased() {
                        gardening.append(gardenItem(img: i.img, label: i.label, price: i.price, descrip: i.descrip))
                    }
                    if i.category.lowercased() == "Movies".lowercased() {
                        movies.append(movieItem(img: i.img, label: i.label, price: i.price, descrip: i.descrip))
                    }
                    i = newItem()
                }
                else {
                    print("Can't load null")
                    let alert = UIAlertController(title: "Creating Item Without an Image", message: "Are you sure you want to create this item with no assigned image?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "No, Add Image", style: .default, handler: { action in
                        self.imageBtnClicked()
                        self.tableView.reloadData()
                    }))
                    alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: { action in
                        if let p = Double(self.priceNew.text!) {
                            if inCategories == false {
                                self.i.price = p
                                self.i.img = UIImage()
                                newItems.append(self.i)
                                self.imageBtnClicked()
                                navItems.append(navItem(img: self.imageNew.image!, label: self.i.category))
                                print("-----")
                                print(navItems[navItems.count-1].img)
                                print(navItems[navItems.count-1].label)
                                print("-----")
                                self.warning.text = "New category created. Category image is required."
                                self.nameNew.text = ""
                                self.desNew.text = ""
                                self.categoryNew.text = ""
                                self.warning.text = ""
                                self.priceNew.text = ""
                                self.tableView.reloadData()
                                self.i = newItem()
                                
                            }
                            else {
                                self.i.price = p
                                self.i.img = UIImage()
                                newItems.append(self.i)
                                self.nameNew.text = ""
                                self.desNew.text = ""
                                self.categoryNew.text = ""
                                self.priceNew.text = ""
                                self.warning.text = ""
                                self.tableView.reloadData()
                                self.i = newItem()
                            }
                        }
                        else {
                            self.warning.text = "Invalid price! Please only use numbers and decimals."
                        }
                    }))
                    present(alert, animated: true)
                }
                if inCategories == false {
                    // Prompt for image picker for new Category
                    let alert = UIAlertController(title: "New Category Created", message: "To continue you must add an image for your newly created category. Otherwise, cancel and enter a preset category.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                        print("Cancelled.")
                        self.warning.text = "Cannot create item without *new* category image."
                        newItems.remove(at: newItems.count-1)
                        self.tableView.reloadData()
                    }))
                    alert.addAction(UIAlertAction(title: "Add Image", style: .default, handler: { action in
                        self.imageBtnClicked()
                        navItems.append(navItem(img: self.imageNew.image!, label: self.i.category))
                        print(navItems[navItems.count-1].label)
                        print(navItems[navItems.count-1].img)
                        self.navigationController?.popViewController(animated: true)

                    }))
                    present(alert, animated: true)
                }
                else {
                    if i.category.lowercased() == "Grocery".lowercased() {
                        groceries.append(groceryItem(img: i.img, label: i.label, price: i.price, descrip: i.descrip))
                    }
                    if i.category.lowercased() == "Garden".lowercased() {
                        gardening.append(gardenItem(img: i.img, label: i.label, price: i.price, descrip: i.descrip))
                    }
                    if i.category.lowercased() == "Movies".lowercased() {
                        movies.append(movieItem(img: i.img, label: i.label, price: i.price, descrip: i.descrip))
                    }
                }

            }
            else {
                self.warning.text = "Invalid price! Please only use numbers and decimals."
            }
        }
        else {
            warning.text = "Please fill in all text fields to continue..."
        }
        self.tableView.reloadData()

//        let alert = UIAlertController(title: "New shopping item", message: "Create and customize a new shopping category!", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
//            print("Cancelled.")
//        }))
//        alert.addAction(UIAlertAction(title: "Select Image and Complete!", style: .default, handler: { action in
//            self.imageBtnClicked()
//            guard let fields = alert.textFields else {
//                return
//            }
//            self.collectInfo(input: fields, alert: alert)
//            print("-----")
//            print(self.i.img)
//            print(self.i.label)
//            print("-----")
//            self.tableView.reloadData()
//        }))
//        alert.addAction(UIAlertAction(title: "Continue Without Image", style: .default, handler: { action in
//            guard let fields = alert.textFields else {
//                return
//            }
//            self.collectInfo(input: fields, alert: alert)
//            self.tableView.reloadData()
//        }))
//        alert.addTextField { field in
//            field.placeholder = "Item Name"
//            field.returnKeyType = .next
//            field.keyboardType = .default
//        }
//        alert.addTextField { field in
//            field.placeholder = "Description"
//            field.returnKeyType = .next
//            field.keyboardType = .default
//        }
//        alert.addTextField { field in
//            field.placeholder = "Price"
//            field.returnKeyType = .next
//            field.keyboardType = .decimalPad
//        }
//        alert.addTextField { field in
//            field.placeholder = "Category"
//            field.returnKeyType = .next
//            field.keyboardType = .decimalPad
//        }
//
//        present(alert, animated: true)
//        self.i = newItem()

    }
    
    func imageBtnClicked() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func collectInfo(input: [UITextField], alert: UIAlertController) {
        if input[0].text != "" && input[1].text != "" && input[2].text != "" && input[3].text != ""  {
            let name = input[0].text
            let des = input[1].text
            let price = input[2].text
            let categ = input[3].text
            var inCategories = false
            for i in navItems {
                if i.label.lowercased() == categ?.lowercased() {
                    inCategories = true
                }
            }
            if inCategories == false {
                // Prompt for image picker for new Category
            }
            guard let priceDouble = Double(price!) else {
                warning.text = "Invalid price! Please only use numbers and decimals."
                return
            }
            newItems[newItems.count-1].price = priceDouble
            newItems[newItems.count-1].descrip = des!
            newItems[newItems.count-1].category = categ!
            newItems[newItems.count-1].label = name!
        }
        else {
            warning.text = "Please fill in all required fields to continue..."
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageNew.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewCategoryCell", for: indexPath) as? NewCategoryCell {
            
            cell.cellSetup(with: newItems[indexPath.row])
            cell.addButton.tag = indexPath.row
            cell.addButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
            return cell
        }
        return UITableViewCell()
    }
    
    @objc func addItem(sender: UIButton) {
        var toggle = true
        for i in myCart {
            if i.label == newItems[sender.tag].label {
                toggle = false
                i.quantity += 1
                i.subtotal = Double(i.quantity)*i.origPrice
            }
        }
        if toggle == true {
            myCart.append(cartItem(origPrice: newItems[sender.tag].price, category: newItems[sender.tag].category, label: newItems[sender.tag].label, quantity: 1))
        }
        let alert = UIAlertController(title: "Item Added to Cart!", message: "Press dismiss to continue, or head to Your Cart", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("Cancelled.")
        }))
        alert.addAction(UIAlertAction(title: "Your Cart", style: .default, handler: { action in
            if let next = self.storyboard?.instantiateViewController(withIdentifier: "CartController") as? CartController {
                next.title = "Your Cart"
                self.navigationController?.pushViewController(next, animated: true)
            }
        }))
        present(alert, animated: true)
        tableView.reloadData()
    }

}

/* Setting up classes for pages */
class newItem {
    var img: UIImage
    var label: String
    var price: Double
    var descrip: String
    var category: String
    
    init(img: UIImage, label: String, price: Double, descrip: String, category: String) {
        self.img = img
        self.label = label
        self.price = price
        self.descrip = descrip
        self.category = category
    }
    
    init()   {
        self.img = UIImage()
        self.label = ""
        self.price = 0.0
        self.descrip = ""
        self.category = ""
    }
}

/* Initializing items */
var newItems: [newItem] = [
    newItem(img: UIImage(), label: " Maison Margiela Tabi Boots", price: 549.99, descrip: "Very durable. True to size.", category: "Shoes"),
]
