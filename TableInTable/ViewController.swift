//
//  ViewController.swift
//  TableInTable
//
//  Created by Michał Kaczmarek on 26.09.2017.
//  Copyright © 2017 Michał Kaczmarek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let cellId = "firstTableCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.reloadData()
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(NextTable.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = UIColor.green
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        
        view.addSubview(tableView)
        view.backgroundColor = UIColor.gray
        view.addConstraintsWithFormat("V:|-60-[v0]-5-|", views: tableView)
        view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: tableView)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("ViewController numberOfRowsInSection")
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print("ViewController heightForRowAt \(indexPath.row)")
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        print("ViewController estimatedHeightForRowAt \(indexPath.row)")
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("ViewController cell at index \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NextTable
        cell.layoutIfNeeded()
        return cell
    }
}
