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

    public var webViewDidStart: Observable<NavigationEvent> {
        return trigger(#selector(base.webView(_:didStartProvisionalNavigation:)))
    }

    public var webViewDidRedirectServer: Observable<NavigationEvent> {
        return trigger(#selector(base.webView(_:didReceiveServerRedirectForProvisionalNavigation:)))
    }

    public var webViewDidFailOnLoading: Observable<NavigationError> {
        return trigger(#selector(base.webView(_:didFailProvisionalNavigation:withError:)))
    }

    public var webViewDidCommit: Observable<NavigationEvent> {
        return trigger(#selector(base.webView(_:didCommit:)))
    }

    public var webViewDidFinish: Observable<NavigationEvent> {
        return trigger(#selector(base.webView(_:didFinish:)))
    }

    public var webViewDidFailOnCommit: Observable<NavigationError> {
        return trigger(#selector(base.webView(_:didFail:withError:)))
    }

    public var webViewWebContentProcessDidTerminate: Observable<WKWebView> {
        return trigger(#selector(base.webViewWebContentProcessDidTerminate(_:)))
    }
}

// MARK: - internal
internal extension Reactive where Base: WKNavigationDelegate {

    fileprivate func trigger<T>(_ selector: Selector) -> Observable<T> where T: ParametersConvertible {
        return sentMessage(selector).map(T.instanciate).shareReplay(1)
    }
}
