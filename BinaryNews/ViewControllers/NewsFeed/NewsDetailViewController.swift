//
//  NewsDetailViewController.swift
//  BinaryNews
//
//  Created by LinhNguyen on 8/31/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class NewsDetailViewController: UIViewController {

    @IBOutlet var progressView: UIProgressView!

    @IBOutlet var webView: WKWebView!
    private var observation: NSKeyValueObservation? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(NSURLRequest(url: URL(string: "https://www.dailymail.co.uk/news/article-8680569/Suspect-48-fatal-shooting-Patriot-Prayer-supporter-describes-100-ANTIFA.html")!) as URLRequest)

        // add observer to update estimated progress value
        observation = webView.observe(\.estimatedProgress, options: [.new]) { _, _ in
             print("progress : \(Float(self.webView.estimatedProgress))")
            let progress = Float(self.webView.estimatedProgress)
            self.progressView.progress = Float(self.webView.estimatedProgress)
            if progress == 1.0 {
                self.progressView.isHidden = true
            }
        }
    }
    deinit {
        observation = nil
    }

}
