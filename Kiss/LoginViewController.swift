//
//  LoginViewController.swift
//  Kiss
//
//  Created by xiaoP on 2017/3/31.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional
import Hyphenate

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    var loginFinishHandler: (()-> Void)?
    let bag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.ks.black
        bind()
    }

    fileprivate func bind() {
        Observable.combineLatest(
            username.rx.text.orEmpty,
            password.rx.text.orEmpty
        )
            .map { (username: String, password: String) -> Bool in
                return !(username.isEmpty || password.isEmpty)
            }
            .bindTo(login.rx.isEnabled)
            .disposed(by: bag)
        
        login.rx.tap
            .asObservable()
            .debounce(0.5, scheduler: MainScheduler.instance)
            .bindNext { [weak self] _ in
                guard let `self` = self else {
                    return
                }
                let emLoginError = EMClient.shared().login(withUsername: self.username.text!, password: self.password.text!)
                if let emLoginError = emLoginError {
                    print("ease mob login failure. \(emLoginError)")
                } else {
                    print("ease mob login success.")
                    self.loginFinishHandler?()
                }
            }
            .disposed(by: bag)
    }

}
