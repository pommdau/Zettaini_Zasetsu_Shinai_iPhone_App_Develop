//
//  DetailViewController.swift
//  NewsReader
//
//  Created by HIROKI IKEUCHI on 2019/04/09.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController : UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var link:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: self.link) {
            // URLRequestクラスのインスタンスを作成
            // インターネットからダウンロードするデータの保存方法を設定するため
            let request = URLRequest(url: url)
            self.webView.load(request)  // webViewに対象のWebサイトを表示する
        }
    }
}
