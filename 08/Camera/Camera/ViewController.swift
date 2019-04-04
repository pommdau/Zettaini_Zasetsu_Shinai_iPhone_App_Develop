//
//  ViewController.swift
//  Camera
//
//  Created by HIROKI IKEUCHI on 2019/04/04.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    // カメラボタンがタップされた際の処理
    @IBAction func launchCamera(_ sender: UIBarButtonItem) {
        // 画像の取得方法を、定数cameraに代入
        let camera = UIImagePickerController.SourceType.camera
        
        // カメラ機能が使用可能かどうか
        if UIImagePickerController.isSourceTypeAvailable(camera) {
            let picker = UIImagePickerController() // カメラの画面表示用にモーダルビューコントローラーを作成
            picker.sourceType = camera             // 画像の取得方法をモーダルビューコントローラーに設定
            picker.delegate = self
            self.present(picker, animated: true)   // モーダルビューコントローラーを前面に出すことで、カメラ画面を表示する
        }
    }
    
    // ユーザが撮影し終わったときの処理（画像を表示する）
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage // 撮影した画像の取得
        self.imageView.image = image                                                // イメージビューに画像を表示
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)                        // 画像を写真アルバムに保存
        self.dismiss(animated: true)                                                // モーダルビューコントローラを消去する
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

