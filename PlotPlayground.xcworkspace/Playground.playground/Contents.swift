/**
*  PlotPlayground
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

import Plot
import PlotPlayground
import WebKit
import PlaygroundSupport

// Defining our main HTML page:

struct WebPage: Component {
    var body: Component {
        Div {
            Image(logoURL).class("logo")
            H1("A Plot-powered web page")
            Paragraph(welcomeText)

            H2("Some useful links")
            LinkList()

            H2("A form")
            Form(url: "/") {
                TextField(placeholder: "First name")
                TextField(placeholder: "Last name")
                SubmitButton("Send")
            }

            H2("A table")
            Table {
                TableRow {
                    Text("Building")
                    Text("HTML pages")
                }
                TableRow {
                    Text("in Swift")
                    Text("is quite nice!")
                }
            }
        }
    }

    private var logoURL: URLRepresentable {
        "https://raw.githubusercontent.com/JohnSundell/Plot/master/Logo.png"
    }

    private var welcomeText: String {
        """
        Welcome to this Plot-powered web page built \
        entirely in Swift!
        """
    }
}

// A custom component that renders a series of links:

struct LinkList: Component {
    var body: Component {
        List {
            Link("Plot",
                url: "https://github.com/johnsundell/plot"
            )
            Link("Swift by Sundell",
                url: "https://swiftbysundell.com"
            )
            Link("The official Swift website",
                url: "https://swift.org"
            )
        }
        .listStyle(.ordered)
    }
}

// Showing our web page in the playground's live view:

PlaygroundPage.current.liveView = try WKWebView(
    frame: CGRect(
        origin: .zero,
        size: CGSize(width: 500, height: 700)
    ),
    component: WebPage(),
    cssURL: Bundle.main.url(
        forResource: "Styles",
        withExtension: "css"
    )!,
    baseURL: Bundle.main.resourceURL!
)
