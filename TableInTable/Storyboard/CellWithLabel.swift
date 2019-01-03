//
//  CellWithLabel.swift
//  TableInTable
//
//  Created by Michał Kaczmarek on 03/01/2019.
//  Copyright © 2019 Michał Kaczmarek. All rights reserved.
//

import UIKit

class CellWithLabel: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.text = ""
    }
    
    func setupData(number: Int) {
        label.text = ""
        for _ in 0...number {
            label.text?.append("Some text without context ")
        }
    }
}
