import UIKit

@objc protocol KyotoProtocol {
    func stopGlobalWarming()
    @objc optional func chargeCarbonTax()
}

class Japan:KyotoProtocol {
    func stopGlobalWarming() {
        print("クリーンエネルギーを推進します")
        print("森林を増やします")
    }
}

var country:KyotoProtocol = Japan() // KyotoProtocolを採用しているclass instanceしか変数に格納できない



