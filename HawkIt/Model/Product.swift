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
    
    init(title: String, cost: Double) {
        self.title = title
        self.cost = cost
    }
    
    init?(valueDict: [String: Any]) {
        guard let title = valueDict["title"] as? String, let cost = valueDict["cost"] as? Double else { return nil }
        self.title = title
        self.cost = cost
    }
    
    func price() -> String {
        let costString = String(format: "%.2f", cost)
        return "$\(costString)"
    }
    
    func parameters() -> [String: Any] {
        let dict: [String: Any] = ["title": title, "cost": cost]
        return dict
    }
}
