//
//  WKNavigationDelegateError.swift
//  RxWKWebViewDelegate
//
//  Created by Takehito Koshimizu on 2017/03/05.
//  Copyright © 2017年 Takehito Koshimizu. All rights reserved.
//

import WebKit

public struct NavigationError: Error, ParametersConvertible {
    public internal(set) weak var webView: WKWebView?
    public let navigation: WKNavigation
    public let error: Error

    internal init(parameters: [Any]) {
        webView = parameters.get()
        navigation = parameters.get()
        error = parameters.get()
    }

    internal static func instanciate(parameters: [Any]) -> NavigationError {
        return self.init(parameters: parameters)
    }
}
