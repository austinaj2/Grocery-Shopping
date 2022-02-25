//
//  ViewController.swift
//  Grocery Shopping
//
//  Created by Yabby Yimer Wolle on 2/24/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let logo = UIImageView(image: UIImage(named: "AppLogo"))
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bgImageView: UIImageView!
    let bgView = UIImageView(image: UIImage(named: "background"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationUI()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundView = bgView
        var layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 125, height: 125)
    }
    
    
    func setUpNavigationUI() {
        navigationItem.titleView = logo
    }
    
    // Populatiung collection view
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 125, height: 125)
//    }
    
}

