import UIKit

class SportsCar {
    var distance = 0
    func drive() {
        distance += 10
    }
}

class Truck {
    var distance = 0
    func drive() {
        distance += 5
    }
}

var sportsCar = SportsCar()
var truck    = Truck()

sportsCar.drive()
truck.drive()
