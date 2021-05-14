/**
*  PlotPlayground
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

import Plot
import WebKit

public extension WKWebView {
    convenience init(frame: CGRect,
                     component: Component,
                     cssURL: URL,
                     baseURL: URL) throws {
        self.init(frame: frame)
        let css = try String(contentsOf: cssURL)
        let html = HTML(head: [.style(css)]) { component }
        loadHTMLString(html.render(), baseURL: baseURL)
    }
}
