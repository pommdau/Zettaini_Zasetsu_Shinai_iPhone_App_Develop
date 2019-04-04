import UIKit

class Lawer {
    func defend() {
        print("異議あり！")
    }
}

class Defender {
    var delegate:Lawer?
}

let taro = Defender()
taro.delegate = Lawer()
taro.delegate!.defend()
