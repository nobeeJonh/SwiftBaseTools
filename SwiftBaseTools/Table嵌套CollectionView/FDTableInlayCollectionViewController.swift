//
//  FDTableInlayCollectionViewController.swift
//  SwiftBaseTools
//
//  Created by yons on 2019/6/12.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit
import UITableView_FDTemplateLayoutCell

class FDTableInlayCollectionViewController: WKBaseViewController {
    
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
        tableView.wk_registerCell(cell: FDTableViewCell.self)
    }
}

// MARK: - DataSource
extension FDTableInlayCollectionViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.wk_dequeueReusableCell(indexPath: indexPath) as FDTableViewCell
        configureCell(cell: cell)
        return cell
    }
}

// MARK: - Delegate
extension FDTableInlayCollectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.fd_heightForCell(withIdentifier: "CollectionViewTableViewCell", cacheBy: indexPath, configuration: { [weak self](cell) in
            self?.configureCell(cell: cell as! FDTableViewCell)
        })
    }
}

// MARK: - 配置cell
extension FDTableInlayCollectionViewController {
    private func configureCell(cell: FDTableViewCell) {
        cell.titles = titles
    }
}
