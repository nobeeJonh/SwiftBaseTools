//
//  PickerViewController.swift
//  SwiftBaseTools
//
//  Created by yons on 2019/6/12.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class PickerViewController: WKBaseViewController {

    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isUserInteractionEnabled = false
        return pickerView
    }()
    
    let titles = ["0","1","2","3","4",
                  "5","6","7","8","9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(pickerView)
        pickerView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(50)
            make.centerY.equalTo(view.snp.centerY)
        }
        _ = (0..<8).map({ (component) in
            let row = Int(arc4random() % 10)
            pickerView.selectRow(row, inComponent: component, animated: true)
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = (0..<8).map({ (component) in
            let row = Int(arc4random() % 10)
            pickerView.selectRow(row, inComponent: component, animated: true)
        })
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        _ = (0..<8).map({ (component) in
            let row = Int(arc4random() % 10)
            pickerView.selectRow(row, inComponent: component, animated: true)
        })
    }
}

// MARK: - Delegate, DataSource
extension PickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 8
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles[row]
    }
    
    
}
