//
//  navItem.swift
//  Grocery Shopping
//
//  Created by Yabby Yimer Wolle on 2/24/22.
//

import Foundation
import UIKit

struct navItem {
    let img: UIImage
    let label: String
}

let navItems: [navItem] = [
    navItem(img: UIImage(named: "recent")!, label: "Recent Orders"),
    navItem(img: UIImage(named: "cart")!, label: "Cart"),
    navItem(img: UIImage(named: "grocery")!, label: "Grocery"),
    navItem(img: UIImage(named: "clothing")!, label: "Clothing"),
    navItem(img: UIImage(named: "movies")!, label: "Movies"),
    navItem(img: UIImage(named: "garden")!, label: "Garden"),
    navItem(img: UIImage(named: "elec")!, label: "Electronics"),
    navItem(img: UIImage(named: "books")!, label: "Books"),
    navItem(img: UIImage(named: "appliances")!, label: "Appliances"),
    navItem(img: UIImage(named: "toys")!, label: "Toys")
]
