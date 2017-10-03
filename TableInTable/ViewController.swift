//
//  ViewController.swift
//  TableInTable
//
//  Created by Michał Kaczmarek on 26.09.2017.
//  Copyright © 2017 Michał Kaczmarek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView: OwnTableView = OwnTableView()
    let cellId = "firstTableCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.reloadData()
        view.backgroundColor = UIColor.gray
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(NextTable.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = UIColor.green
        tableView.separatorStyle = .singleLine
        
        view.addSubview(tableView)
        view.addConstraintsWithFormat("V:|-60-[v0]-5-|", views: tableView)
        view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: tableView)
        
        tableView.beginUpdates()
        tableView.reloadData()
        tableView.endUpdates()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NextTable
        return cell
    }
}
