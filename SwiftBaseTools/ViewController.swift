//
//  ViewController.swift
//  SwiftBaseTools
//
//  Created by yons on 2019/6/11.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class ViewController: WKBaseViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    let titles = ["UITableView嵌套CollectionView", "使用FD适配UITableView嵌套CollectionView高度自适应", "滚动到目标日期"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }


}

// MARK: - Delegate, DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = titles[indexPath.row]
        if title == "UITableView嵌套CollectionView" {
            let ctrl = TableInlayCollectionController()
            ctrl.title = title
            self.navigationController?.pushViewController(ctrl, animated: true)
        } else if title == "使用FD适配UITableView嵌套CollectionView高度自适应" {
            let fdCtrl = FDTableInlayCollectionViewController()
            fdCtrl.title = title
            self.navigationController?.pushViewController(fdCtrl, animated: true)
        } else if title == "滚动到目标日期" {
            let pickerCtrl = PickerViewController()
            pickerCtrl.title = title
            self.navigationController?.pushViewController(pickerCtrl, animated: true)
        }
    }
}

