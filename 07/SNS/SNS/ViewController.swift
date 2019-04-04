//
//  ViewController.swift
//  SNS
//
//  Created by HIROKI IKEUCHI on 2019/04/04.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showActivityView(_ sender: UIBarButtonItem) {
        func showMessage() {
            print("表示完了")
        }
        
        let controller = UIActivityViewController(activityItems: [imageView.image!],
                                                  applicationActivities: nil)
        self.present(controller, animated: true, completion:
            {() -> Void in
                print("表示完了")}
        )
    }
}

