//
//  Reactive.swift
//  RxWKWebViewDelegate
//
//  Created by Takehito Koshimizu on 2017/03/05.
//  Copyright © 2017年 Takehito Koshimizu. All rights reserved.
//

import WebKit

import RxCocoa
import RxSwift

enum WKNavigationState {
}

// MARK: - Reactive
public extension Reactive where Base: WKNavigationDelegate {

    public func webViewDidStart() -> Observable<(webView: WKWebView, navigation: WKNavigation)> {
        return navigation(#selector(base.webView(_:didStartProvisionalNavigation:)))
    }

    public func webViewDidRedirectServer() -> Observable<(webView: WKWebView, navigation: WKNavigation)> {
        return navigation(#selector(base.webView(_:didReceiveServerRedirectForProvisionalNavigation:)))
    }

    public func webViewDidFailOnLoading() -> Observable<(webView: WKWebView, navigation: WKNavigation, error: Error)> {
        return fail(#selector(base.webView(_:didFailProvisionalNavigation:withError:)))
    }

    func webViewDidCommit() -> Observable<(webView: WKWebView, navigation: WKNavigation)> {
        return navigation(#selector(base.webView(_:didCommit:)))
    }

    func webViewDidFinish() -> Observable<(webView: WKWebView, navigation: WKNavigation)> {
        return navigation(#selector(base.webView(_:didFinish:)))
    }

    public func webViewDidFailOnCommit() -> Observable<(webView: WKWebView, navigation: WKNavigation, error: Error)> {
        return fail(#selector(base.webView(_:didFail:withError:)))
    }

    public func webViewWebContentProcessDidTerminate() -> Observable<WKWebView> {
        return webView(#selector(base.webViewWebContentProcessDidTerminate(_:)))
    }
}

// MARK: - internal
internal extension Reactive where Base: WKNavigationDelegate {

    func navigation(_ selector: Selector) -> Observable<(webView: WKWebView, navigation: WKNavigation)> {
        return sentMessage(selector)
            .map { ($0.get(), $0.get()) }
            .shareReplay(1)
    }

    func fail(_ selector: Selector) -> Observable<(webView: WKWebView, navigation: WKNavigation, error: Error)> {
        return sentMessage(selector)
            .map { ($0.get(), $0.get(), $0.get()) }
            .shareReplay(1)
    }

    func webView(_ selector: Selector) -> Observable<WKWebView> {
        return sentMessage(selector)
            .map { $0.get() }
            .shareReplay(1)
    }
}
