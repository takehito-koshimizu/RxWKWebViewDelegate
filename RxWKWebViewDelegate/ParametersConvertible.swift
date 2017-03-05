//
//  ParametersConvertible.swift
//  RxWKWebViewDelegate
//
//  Created by Takehito Koshimizu on 2017/03/05.
//  Copyright © 2017年 Takehito Koshimizu. All rights reserved.
//

import WebKit

internal protocol ParametersConvertible {
    static func instanciate(parameters: [Any]) -> Self
}

extension WKWebView: ParametersConvertible {

    internal static func instanciate(parameters: [Any]) -> Self {
        return parameters.get()
    }
}
