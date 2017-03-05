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

// MARK: - Reactive
public extension Reactive where Base: WKNavigationDelegate {

    public var webViewDidStart: Observable<WKNavigationDelegateEvent> {
        return event(#selector(base.webView(_:didStartProvisionalNavigation:)))
    }

    public var webViewDidRedirectServer: Observable<WKNavigationDelegateEvent> {
        return event(#selector(base.webView(_:didReceiveServerRedirectForProvisionalNavigation:)))
    }

    public var webViewDidFailOnLoading: Observable<WKNavigationDelegateError> {
        return error(#selector(base.webView(_:didFailProvisionalNavigation:withError:)))
    }

    public var webViewDidCommit: Observable<WKNavigationDelegateEvent> {
        return event(#selector(base.webView(_:didCommit:)))
    }

    public var webViewDidFinish: Observable<WKNavigationDelegateEvent> {
        return event(#selector(base.webView(_:didFinish:)))
    }

    public var webViewDidFailOnCommit: Observable<WKNavigationDelegateError> {
        return error(#selector(base.webView(_:didFail:withError:)))
    }

    public var webViewWebContentProcessDidTerminate: Observable<WKWebView> {
        return webView(#selector(base.webViewWebContentProcessDidTerminate(_:)))
    }
}

// MARK: - internal
internal extension Reactive where Base: WKNavigationDelegate {

    func event(_ selector: Selector) -> Observable<WKNavigationDelegateEvent> {
        return sentMessage(selector)
            .map(WKNavigationDelegateEvent.init)
            .shareReplay(1)
    }

    func error(_ selector: Selector) -> Observable<WKNavigationDelegateError> {
        return sentMessage(selector)
            .map(WKNavigationDelegateError.init)
            .shareReplay(1)
    }

    func webView(_ selector: Selector) -> Observable<WKWebView> {
        return sentMessage(selector)
            .map { $0.get() }
            .shareReplay(1)
    }
}
