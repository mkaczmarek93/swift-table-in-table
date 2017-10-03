//
//  OwnTableView.swift
//  TableInTable
//
//  Created by Michał Kaczmarek on 02.10.2017.
//  Copyright © 2017 Michał Kaczmarek. All rights reserved.
//

import UIKit

class OwnTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
}
