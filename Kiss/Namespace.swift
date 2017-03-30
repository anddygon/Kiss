//
//  Namespace.swift
//  Kiss
//
//  Created by xiaoP on 2017/3/31.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import Foundation

public struct Kiss<Base> {
    /// Base object to extend.
    public let base: Base
    
    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has Kiss extensions.
public protocol KissCompatible {
    /// Extended type
    associatedtype CompatibleType
    
    /// Kiss extensions.
    static var ks: Kiss<CompatibleType>.Type { get set }
    
    /// Kiss extensions.
    var ks: Kiss<CompatibleType> { get set }
}

extension KissCompatible {
    /// Kiss extensions.
    public static var ks: Kiss<Self>.Type {
        get {
            return Kiss<Self>.self
        }
        set {
            // this enables using Kiss to "mutate" base type
        }
    }
    
    /// Kiss extensions.
    public var ks: Kiss<Self> {
        get {
            return Kiss(self)
        }
        set {
            
        }
    }
}

import class Foundation.NSObject

/// Extend NSObject with `rx` proxy.
extension NSObject: KissCompatible { }
extension String: KissCompatible { }
