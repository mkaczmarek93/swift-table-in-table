//
//  NextTable.swift
//  TableInTable
//
//  Created by Michał Kaczmarek on 26.09.2017.
//  Copyright © 2017 Michał Kaczmarek. All rights reserved.
//

import UIKit

class NextTable: UITableViewCell {
    
    var myTableView: InnerTableView!
    let cellId = "nextTableCellId"
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.brown
        setupView()
        myTableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines =  0
        label.lineBreakMode = .byWordWrapping
        label.text = "next table:"
        label.textColor = UIColor.black
        label.sizeToFit()
        label.backgroundColor = UIColor.cyan
        return label
    }()
    
    func setupView() {
        myTableView = InnerTableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorStyle = .singleLineEtched
        myTableView.backgroundColor = UIColor.blue
        myTableView.estimatedRowHeight = 60
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.register(TableCell.self, forCellReuseIdentifier: cellId)
        myTableView.isScrollEnabled = false
        
        addSubview(myTableView)
        addSubview(label)
//        addConstraintsWithFormat("V:|-15-[v0]-15-|", views: myTableView)
        addConstraintsWithFormat("H:|-30-[v0]-30-|", views: myTableView)
        addConstraintsWithFormat("H:|-30-[v0]-30-|", views: label)
        
        addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 15))
        addConstraint(NSLayoutConstraint(item: myTableView, attribute: .top, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: myTableView, attribute: .top, multiplier: 1.0, constant: 0))
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
//        print("NextTable numberOfRowsInSection")
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print("NextTable heightForRowAt \(indexPath.row)")
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        print("NextTable estimatedHeightForRowAt \(indexPath.row)")
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("NextTable cell at index \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableCell
        cell.layoutIfNeeded()
        return cell
    }
}

class InnerTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        return self.contentSize
    }
}
