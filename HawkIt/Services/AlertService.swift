//
//  AlertService.swift
//  HawkIt
//
//  Created by Dan Lindsay on 2017-12-05.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit

class AlertService {
    private init() {}
    
    static func addProductAlert(in vc: UIViewController, completion: @escaping (Product) -> Void) {
        let alert = UIAlertController(title: "New Product", message: "What's for sale?", preferredStyle: .alert)
        alert.addTextField { (titleTextField) in
            titleTextField.placeholder = "Title"
        }
        alert.addTextField { (priceTextField) in
            priceTextField.placeholder = "Price"
            priceTextField.keyboardType = .numberPad
        }
        
        let send = UIAlertAction(title: "Send", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text, let price = alert.textFields?.last?.text, let cost = Double(price) else { return }
            
            let product = Product(title: title, cost: cost)
            
            completion(product)
        }
        alert.addAction(send)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func subscribeAlert(in vc: UIViewController) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let subscribe = UIAlertAction(title: "Subscribe", style: .default) { (_) in
            
        }
        let unsubscribe = UIAlertAction(title: "Unsubscribe", style: .default) { (_) in
            
        }
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
        vc.present(alert, animated: true, completion: nil)
    }
}
