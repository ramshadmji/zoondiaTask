//
//  HomeVC.swift
//  ProductApp
//
//  Created by Mohammed Ramshad K on 28/05/21.
//

import UIKit

class HomeVC: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var product = [Products]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        getProducts()
    }
    
    func getProducts() {
        let url = "https://fakemyapi.com/api/fake?id=0c354035-45cb-4954-a5c2-bd4503d38c61"
        ApiManager().callingProductApi(url: url) { [self] (response) in
            product = response.products!
            collectionView.reloadData()
        } failure: { (Error) in
            self.showToast(message: "Something went wrong")
            debugPrint(Error)
            
        }

    }
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell{
            cell.configCell(prod: product[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
        
    }
    
    
}
