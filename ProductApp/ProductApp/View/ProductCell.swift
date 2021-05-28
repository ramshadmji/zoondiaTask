//
//  ProductCell.swift
//  ProductApp
//
//  Created by Mohammed Ramshad K on 28/05/21.
//

import UIKit
import Kingfisher
class ProductCell: UICollectionViewCell {
    var product: Products?
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var proice: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var addButton: RoundedBuitton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configCell(prod: Products?)  {
        guard let imgurl = URL(string: (prod?.images![0])!) else {
            return
        }
        itemImage.kf.setImage(with: imgurl, placeholder: UIImage(named: "PlaceHolder"), options: .none, completionHandler: nil)
        title.text = prod?.title ?? ""
        if let Price = prod?.price{ 
            proice.text = "Rs. \(Price)"
        }
        
    }

}
