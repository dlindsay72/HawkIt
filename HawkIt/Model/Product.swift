//
//  Product.swift
//  HawkIt
//
//  Created by Dan Lindsay on 2017-12-05.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Foundation

struct Product {
    let title: String
    let cost: Double
    
    func price() -> String {
        let costString = String(format: "%.2f", cost)
        return "$\(costString)"
    }
}
