//
//  ListViewController.swift
//  NewsReader
//
//  Created by HIROKI IKEUCHI on 2019/04/05.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, XMLParserDelegate {
    var parser:XMLParser!
    var items = [Item]()
    var item:Item?
    var currentString = ""
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startDownload()
    }
    
    // RSSのダウンロード
    func startDownload() {
        self.items = []
        if let url = URL(string: "https://wired.jp/rssfeeder/") {
            // 不正なURLの場合nilが返されるためOptional Bindingを使う
            if let parser = XMLParser(contentsOf: url) {
                self.parser = parser
                self.parser.delegate = self
                self.parser.parse() // データの解析を開始
            }
        }
    }
    
    // 要素名の開始タグが見つかるごとに毎回呼び出されるメソッド
    func parser(_ parser: XMLParser,
                didStartElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?,
                attributes attributeDict: [String : String] = [:]) {
        self.currentString = ""
        if elementName == "item" {
            self.item = Item()
        }
    }
    
    // 内容が見つかったときに自動で呼ばれるメソッド
    func parser(_ parser: XMLParser,
                foundCharacters string: String) {
        self.currentString += string
    }
    
    // 要素名の終了タグが見つかる際に呼ばれるメソッド
    func parser(_ parser: XMLParser,
                didEndElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?) {
        switch elementName {
        case "title":
            self.item?.title = currentString
        case "link":
            self.item?.link  = currentString
        case "item":
            self.items.append(self.item!)   // itemの場合、それが1つのニュース記事の終わりを意味する
        default:
            break
        }
    }
    
    // すべてのデータの解析が終了すると自動的に呼ばれるメソッド
    func parserDidEndDocument(_ parser: XMLParser) {
        self.tableView.reloadData()
    }
    
    // 画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let item = items[indexPath.row]
            let controller = segue.destination as! DetailViewController     // 遷移先のビューコントローラを格納
            controller.title = item.title   // デフォルトで持つproperty?
            controller.link = item.link
        }
    }
    
}
