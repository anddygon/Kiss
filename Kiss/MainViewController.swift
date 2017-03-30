//
//  MainViewController.swift
//  Kiss
//
//  Created by xiaoP on 2017/3/31.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configTabbar()
    }

    // MARK: - UI 设置
    fileprivate func configTabbar() {
        tabBar.tintColor = UIColor.orange
        
        let items = tabBar.items!
        let normalImages = [#imageLiteral(resourceName: "kiss_normal"), #imageLiteral(resourceName: "contacts_normal"), #imageLiteral(resourceName: "me_normal")]
        let selectedImages = [#imageLiteral(resourceName: "kiss_pressed"), #imageLiteral(resourceName: "contacts_pressed"), #imageLiteral(resourceName: "me_pressed")]
        let titles = ["Kiss", "通讯录", "我"]
        for (index, item) in items.enumerated() {
            item.image = normalImages[index]
            item.selectedImage = selectedImages[index]
            item.title = titles[index]
        }
    }
    
}
