//
//  ViewController.swift
//  Hello
//
//  Created by HIROKI IKEUCHI on 2019/04/04.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func sayHello(_ sender: Any) {
        label.text = "こんにちは"
    }
    
    
}

