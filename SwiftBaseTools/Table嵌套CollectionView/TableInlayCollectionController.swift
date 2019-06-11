//
//  TableInlayCollectionController.swift
//  SwiftBaseTools
//
//  Created by yons on 2019/6/11.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class TableInlayCollectionController: WKBaseViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    let titles = ["Swift", "Java", "Objective-C", "Kotlin", "VB",
                  "C++", "C#", ".Net", "PHP", "Go", "C", "Python",
                  "JavaScript", "SQL", "Ruby", "MATLAB"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "刷新", style: .plain, target: self, action: #selector(refresh))
        tableView.wk_registerCell(cell: CollectionViewTableViewCell.self)
    }
    
    @objc private func refresh() {
        tableView.reloadData()
    }
}

// MARK: - DataSource
extension TableInlayCollectionController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.wk_dequeueReusableCell(indexPath: indexPath) as CollectionViewTableViewCell
        cell.titles = titles
        return cell
    }
}
