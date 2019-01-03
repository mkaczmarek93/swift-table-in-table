//
//  NextTable.swift
//  TableInTable
//
//  Created by Michał Kaczmarek on 26.09.2017.
//  Copyright © 2017 Michał Kaczmarek. All rights reserved.
//

import UIKit

class NextTable: UITableViewCell {
    
    var myTableView: OwnTableView = OwnTableView()
    let cellId = "nextTableCellId"
    
    var number: Int!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.brown
        setupView()
        myTableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView() {
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorStyle = .singleLineEtched
        myTableView.backgroundColor = UIColor.blue
        myTableView.register(TableCell.self, forCellReuseIdentifier: cellId)
        myTableView.isScrollEnabled = false
        
        addSubview(myTableView)
        addConstraintsWithFormat("H:|-30-[v0]-30-|", views: myTableView)
        
        addConstraint(NSLayoutConstraint(item: myTableView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 15))
        addConstraint(NSLayoutConstraint(item: myTableView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -15))
    }
}

extension NextTable: UITableViewDelegate {
    
}

extension NextTable: UITableViewDataSource {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableCell
        cell.setupData(number: indexPath.row)
        cell.layoutIfNeeded()
        return cell
    }
}
