//
//  User.swift
//  Kiss
//
//  Created by xiaoP on 2017/3/31.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import Foundation

class User {
    static let shared = User()
    fileprivate(set) var id: String = ""
    
    private init() {
        
        
    }
}
