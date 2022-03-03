//
//  ViewController.swift
//  Grocery Shopping
//
//  Created by Yabby Yimer Wolle on 2/24/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bgImageView: UIImageView!
    let bgView = UIImageView(image: UIImage(named: "background"))
    var myIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setUpUI()
    }
    
    /* Setting up UI, Navigation layout*/
    func setUpUI() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "AppLogo"))
        bgImageView.image = UIImage(named: "background")
        let layout =  self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 125, height: 125)
        layout.sectionInset = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
    }
    
    /* Populatiung collection view */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return navItems.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "navItemCollectionViewCell", for: indexPath) as? navItemCollectionViewCell {
            
            cell.cellSetup(with: navItems[indexPath.row])
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    /* On selection of a cell */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        if navItems[myIndex].label == "Grocery" {
            self.performSegue(withIdentifier: "goToGrocery", sender: self)
        }
        if navItems[myIndex].label == "Your Cart" {
            self.performSegue(withIdentifier: "goToCart", sender: self)
        }

    }
    
    /* Passing data through segue */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGrocery" {
            if let nextVC = segue.destination as? DetailController {
                nextVC.passedIndex = myIndex
                nextVC.title = navItems[myIndex].label
            }
        }
        if segue.identifier == "goToCart" {
            if let nextVC = segue.destination as? CartController {
                nextVC.passedIndex = myIndex
                nextVC.title = navItems[myIndex].label
            }
        }
    }
}

/* Setting up class for categories */
class navItem {
    var img: UIImage
    var label: String
    
    init(img: UIImage, label: String) {
        self.img = img
        self.label = label
    }
}

/* Initializing category items */
let navItems: [navItem] = [
    navItem(img: UIImage(named: "recent")!, label: "Recent Orders"),
    navItem(img: UIImage(named: "cart")!, label: "Your Cart"),
    navItem(img: UIImage(named: "grocery")!, label: "Grocery"),
    navItem(img: UIImage(named: "clothing")!, label: "Clothing"),
    navItem(img: UIImage(named: "movies")!, label: "Movies"),
    navItem(img: UIImage(named: "garden")!, label: "Garden"),
    navItem(img: UIImage(named: "elec")!, label: "Electronics"),
    navItem(img: UIImage(named: "books")!, label: "Books"),
    navItem(img: UIImage(named: "appliances")!, label: "Appliances"),
    navItem(img: UIImage(named: "toys")!, label: "Toys")
]

