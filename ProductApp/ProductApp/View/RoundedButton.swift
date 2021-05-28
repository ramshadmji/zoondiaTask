//
//  RoundedButton.swift
//  ProductApp
//
//  Created by Mohammed Ramshad K on 28/05/21.
//

import Foundation
import UIKit

class RoundedBuitton: UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 10
    }
}
