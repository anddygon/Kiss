//
//  AppDelegate.swift
//  Kiss
//
//  Created by xiaoP on 2017/3/30.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import UIKit
import Hyphenate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let options = EMOptions.init(appkey: AppInfo.emKey)
        let emInitialError =  EMClient.shared().initializeSDK(with: options)
        if let emInitialError = emInitialError {
            print("ease mob initial failure. \(emInitialError)")
        } else {
            print("ease mob initial success.")
        }
        
        setupRootViewController()
        
        return true
    }

    

}
// MARK: custom config
extension AppDelegate {
    
    fileprivate func setupRootViewController() {
        let loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as! LoginViewController
        loginVC.loginFinishHandler = { [weak self] in
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            self?.window?.rootViewController = mainVC
        }
        window?.rootViewController = loginVC
        
        
    }
    
}
