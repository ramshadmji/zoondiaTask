//
//  ProductModel.swift
//  ProductApp
//
//  Created by Mohammed Ramshad K on 28/05/21.
//

import Foundation
struct Product: Codable{
    var products: [Products]?
}
struct Products: Codable {
    var title: String?
    var images: [String]?
    var price: pricing?
}
struct pricing: Codable {
    var price: String?
}
