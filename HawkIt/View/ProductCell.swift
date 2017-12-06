//
//  ProductCell.swift
//  HawkIt
//
//  Created by Dan Lindsay on 2017-12-05.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var productLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    
    func configure(with product: Product) {
        productLbl.text = product.title
        costLbl.text = product.price()
    }
    
}
