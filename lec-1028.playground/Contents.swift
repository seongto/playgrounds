import UIKit

var greeting = "Hello, playground"


var person1:(name:String, age:Int, isMan:Bool) = ("John", 20, true)
var person2:(name:String, age:Int, isMan:Bool) = ("Jane", 2, false)

print(person1.1)
print(person2.isMan)


var num:Int = 10

switch num {

case 10:
    print("11")
    fallthrough
case 12:
    print("12")
    fallthrough
default:
    print("33")
}

