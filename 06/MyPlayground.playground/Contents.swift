import UIKit

class Cat {
    func run() {
        print("走る")
    }
}

class Cheetah: Cat {
    override func run() {
        print("時速100km/hで走る")
    }
}

var cheetah = Cheetah()
cheetah.run()
