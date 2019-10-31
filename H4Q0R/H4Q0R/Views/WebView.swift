//
//  WebView.swift
//  H4Q0R
//
//  Created by Sanasar Janjughazyan on 10/31/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeURL = urlString {
            if let url = URL(string: safeURL) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
