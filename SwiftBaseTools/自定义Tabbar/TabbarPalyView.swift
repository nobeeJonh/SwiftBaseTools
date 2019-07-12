//
//  TabbarPalyView.swift
//  SwiftBaseTools
//
//  Created by yons on 2019/7/12.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class TabbarPalyView: UIView {

    lazy var layerView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -1)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    lazy var subLayerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "favicon")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        addSubview(layerView)
        layerView.addSubview(subLayerView)
        
        layerView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        subLayerView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(snp.height).multipliedBy(0.8)
        }
        
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        backgroundView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalTo(backgroundView.snp.center)
            make.width.height.equalTo(50)
        }
    }
}
