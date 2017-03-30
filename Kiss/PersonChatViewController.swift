//
//  PrivateChatViewController.swift
//  Kiss
//
//  Created by xiaoP on 2017/3/30.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import UIKit
import Hyphenate
import RxCocoa
import RxSwift

class PersonChatViewController: UIViewController, EMChatManagerDelegate {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var sendMessage: UIButton!
    fileprivate(set) var conversation: EMConversation!
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        EMClient.shared().chatManager.add(self, delegateQueue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default))
        
        
        sendMessage.rx.tap
            .asObservable()
            .bindNext { [weak self] in
                guard let `self` = self else {
                    return
                }
                let body = EMTextMessageBody(text: self.inputField.text!)
                let message = EMMessage(conversationID: self.conversation.conversationId, from: EMClient.shared().currentUsername, to: self.conversation.conversationId, body: body, ext: nil)
                EMClient.shared().chatManager.send(message, progress: { (_) in
                    
                }, completion: { (msg: EMMessage?, error: EMError?) in
                    if let _ = error {
                        print("发送失败")
                    } else {
                        print("发送成功")
                    }
                })
            }
            .disposed(by: bag)
    }
    
    func messagesDidReceive(_ aMessages: [Any]!) {
        let msg = aMessages[0] as! EMMessage
        if let textMsg = msg.body as? EMTextMessageBody {
            print("收到文字消息: \(textMsg.text)")
        }
    }

    // MARK: 初始化方法
    class func load(conversationID id: String, conversationType type: EMConversationType) -> PersonChatViewController {
        let sb = UIStoryboard(name: "Person", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! PersonChatViewController
        vc.conversation = EMClient.shared().chatManager.getConversation(id, type: type, createIfNotExist: true)
        return vc
    }
    
    deinit {
        EMClient.shared().chatManager.remove(self)
    }
    
}
