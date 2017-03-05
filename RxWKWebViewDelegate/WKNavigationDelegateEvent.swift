//
//  WKNavigationDelegateEvent.swift
//  RxWKWebViewDelegate
//
//  Created by Takehito Koshimizu on 2017/03/05.
//  Copyright © 2017年 Takehito Koshimizu. All rights reserved.
//

import WebKit

public struct WKNavigationDelegateEvent {
    public internal(set) weak var webView: WKWebView?
    public let navigation: WKNavigation

    internal init(parameters: [Any]) {
        webView = parameters.get()
        navigation = parameters.get()
    }
}
