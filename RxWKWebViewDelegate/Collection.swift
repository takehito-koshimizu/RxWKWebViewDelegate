//
//  Collection.swift
//  RxWKWebViewDelegate
//
//  Created by Takehito Koshimizu on 2017/03/05.
//  Copyright © 2017年 Takehito Koshimizu. All rights reserved.
//

import Foundation

internal extension Collection where Iterator.Element == Any {
    func get<T>() -> T {
        return flatMap { $0 as? T }.first!
    }
}
