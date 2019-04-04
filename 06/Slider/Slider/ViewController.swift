//
//  ViewController.swift
//  Slider
//
//  Created by HIROKI IKEUCHI on 2019/04/04.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func showValue(_ sender: UISlider) {
        label.text = "\(sender.value)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

