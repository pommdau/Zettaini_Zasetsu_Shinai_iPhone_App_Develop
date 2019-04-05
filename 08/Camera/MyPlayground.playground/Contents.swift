import UIKit

class Animal{}
class Mammal:Animal{}
class Dog:Mammal{}
class Cat:Mammal{}

var mammals:[Mammal] = [Dog(), Cat()]
var dog:Dog = mammals[0] as! Dog
