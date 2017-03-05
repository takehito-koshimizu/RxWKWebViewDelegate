//
//  WKNavigationDelegate.swift
//  RxWKWebViewDelegate
//
//  Created by Takehito Koshimizu on 2017/03/05.
//  Copyright © 2017年 Takehito Koshimizu. All rights reserved.
//

import WebKit

// MARK: - WKNavigationDelegate
public class WKNavigationDelegateObject: NSObject, WKNavigationDelegate {

    override init() {
        super.init()
    }

    public func webView(
        _ webView: WKWebView,
        didStartProvisionalNavigation navigation: WKNavigation!) {
    }

    public func webView(
        _ webView: WKWebView,
        didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
    }

    public func webView(
        _ webView: WKWebView,
        didFailProvisionalNavigation navigation: WKNavigation!,
        withError error: Error) {
    }

    public func webView(
        _ webView: WKWebView,
        didCommit navigation: WKNavigation!) {
    }

    public func webView(
        _ webView: WKWebView,
        didFinish navigation: WKNavigation!) {
    }

    public func webView(
        _ webView: WKWebView,
        didFail navigation: WKNavigation!,
        withError error: Error) {
    }

    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
    }
}
