//
//  FirstTableViewCell.swift
//  TableInTable
//
//  Created by Michał Kaczmarek on 03/01/2019.
//  Copyright © 2019 Michał Kaczmarek. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableView: OwnTableView!
    
    var number: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FirstTableViewCell: UITableViewDelegate {
    
}

extension FirstTableViewCell: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nil == number {
            number = 1 + Int(arc4random_uniform(UInt32(10 - 1 + 1)))
        }
        return number
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storyboardSecondCellId", for: indexPath) as! CellWithLabel
        cell.setupData(number: indexPath.row)
        cell.layoutIfNeeded()
        return cell
    }
}
