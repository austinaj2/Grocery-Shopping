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
        let direction = navItems[indexPath.row].label
        if direction == "Grocery" {
            self.performSegue(withIdentifier: "goToGrocery", sender: self)
        }
        if direction == "Recent Orders" {
            self.performSegue(withIdentifier: "goToRecent", sender: self)
        }

    }
    
    /* Passing data through segue */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGrocery" {
            if let nextVC = segue.destination as? groceryListTVController {
                nextVC.passedIndex = myIndex
                nextVC.title = navItems[myIndex].label
            }
        }
        if segue.identifier == "goToRecent" {
            if let nextVC = segue.destination as? RecentTVC {
                nextVC.passedIndex = myIndex
                nextVC.title = navItems[myIndex].label
            }
        }
    }
    
    
    
}

