//
//  ProductsService.swift
//  HawkIt
//
//  Created by Dan Lindsay on 2017-12-06.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Foundation

protocol ProductsServiceDelegate {
    func didChange(products: [Product])
}

class ProductsService {
    
    private init() {}
    
    static let shared = ProductsService()
    var delegate: ProductsServiceDelegate?
    
    
    func observeProducts() {
        FIRDatabaseService.shared.observe(.products) { (snapshot) in
            guard let productsSnapshot = ProductsSnapshot(snapshot: snapshot) else { return }
            self.delegate?.didChange(products: productsSnapshot.products)
        }
    }
    
    func post(product: Product) {
        FIRDatabaseService.shared.post(parameters: product.parameters(), to: .products)
    }
}
