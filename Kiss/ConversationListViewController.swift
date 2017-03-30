//
//  ConversationListViewController.swift
//  Kiss
//
//  Created by xiaoP on 2017/3/30.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import UIKit
import Hyphenate

class ConversationListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(PersonChatViewController.load(conversationID: "xiaopeng", conversationType: EMConversationTypeChat), animated: true)
    }
    
}
