//
//  MainVC.swift
//  HawkIt
//
//  Created by Dan Lindsay on 2017-12-05.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        ProductsService.shared.delegate = self
        ProductsService.shared.observeProducts()
        
    }

    @IBAction func addBtnWasPressed(_ sender: Any) {
        AlertService.addProductAlert(in: self) { (product) in
            ProductsService.shared.post(product: product)
        }
    }
    
    @IBAction func onSubscribeBtnWasPressed(_ sender: Any) {
        AlertService.subscribeAlert(in: self)
    }
    

}

//MARK: - UICollectionViewDataSource

extension MainVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.productCell.rawValue, for: indexPath) as? ProductCell else { return UICollectionViewCell() }
        
        let product = products[indexPath.item]
        cell.configure(with: product)
        
        return cell
        
    }
}

//MARK: - ProductsServiceDelegate

extension MainVC: ProductsServiceDelegate {
    func didChange(products: [Product]) {
        self.products = products
        collectionView.reloadData()
    }
}










