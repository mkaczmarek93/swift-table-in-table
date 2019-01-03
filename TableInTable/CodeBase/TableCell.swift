//
//  TableCell.swift
//  TableInTable
//
//  Created by Michał Kaczmarek on 26.09.2017.
//  Copyright © 2017 Michał Kaczmarek. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines =  0
        label.lineBreakMode = .byWordWrapping
        label.text = " "
        label.textColor = UIColor.black
        label.sizeToFit()
        label.backgroundColor = UIColor.red
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.yellow
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(label)
        addConstraintsWithFormat("V:|-8-[v0]-8-|", views: label)
        addConstraintsWithFormat("H:|-5-[v0]-5-|", views: label)
    }
    
    func setupData(number: Int) {
        for _ in 0...number {
            label.text?.append("Some text without context ")
        }
    }
}
