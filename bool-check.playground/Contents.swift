import UIKit



let emptyString: String = ""


print( emptyString == nil ) //Comparing non-optional value of type 'String' to 'nil' always returns false

let nilArr: [Any?] = [nil]

print(nilArr.isEmpty)
