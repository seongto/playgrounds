import UIKit

var greeting = "Hello, playground"
var myArr = greeting.map { String($0) }


print(type(of: myArr[0]))

class MyClass {
    var name: String
    init(_ name: String) {
        self.name = name
    }
}

var aradf1:[MyClass] = [MyClass("jake"), MyClass("tom")]
var arr2:[MyClass] = aradf1


var numberArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
var mySet: Set<String> = Set("jerry".map { String($0) })


/// fileprivate 접근제어자 활용해보기
class Asss {
    fileprivate var acc:String
    
    init(_ date:String) {
        self.acc = date
    }
}

var accc: Asss = Asss("1104")
accc.acc = "1105"



protocol Walkable {
    var feetCount: Int { get }
    
    func walk() -> String
}


protocol Intrable {
    func introduce() -> String
}

class Person: Walkable, Intrable {
    var feetCount: Int = 2
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func walk() -> String {
        return "사람이 걷습니다."
    }
    
    func introduce() -> String {
        return "이 인간은 개체명 \(name)이며, 다리 개수는 \(feetCount)개 입니다. 평범하군요!"
    }
}

struct Cat: Walkable, Intrable {
    var feetCount: Int = 4
    var color: String
    
    init(_ color: String) {
        self.color = color
    }
    
    func walk() -> String {
        return "고양이가 걷습니다."
    }
    
    func introduce() -> String {
        return "이 고양이는 \(color) 색을 가졌고 다리 개수는 \(feetCount)개 입니다. 놀랍군요!"
    }
}


let person = Person("Jake")
person.introduce()
person.walk()

let cat = Cat("black")
cat.introduce()
cat.walk()


func babbling1(_ babbling:[String]) -> Int {
    let arr : [String] = [ "aya", "ye", "woo", "ma" ]
    var answer: Int = 0
    
    for bab in babbling {
        var babb: String = bab
        
        for word in arr {
            if babb.contains(word) && babb != "" {

                babb = babb.replacingOccurrences(of: word, with: "")
                print("after : " + babb)
            }
        }
        
        if babb == "" {
            answer += 1
        }
    }
    
    return answer
}

func babbling2(_ babbling:[String]) -> Int {
    let arr : [String] = [ "aya", "ye", "woo", "ma" ]
    var answer: Int = 0
    
    for babItem in babbling {
        var bab: String = babItem
        
        for word in arr {
            guard !bab.contains(word + word) else {
                print("연속된 단어다!")
                continue
            }
            
            if bab.contains(word) {
                
                print("=========")
                print("bab : \(bab), word : \(word)")
                print("before : " + bab)
                bab = bab.replacingOccurrences(of: word, with: " ")
                print("after : " + bab)
            }
        }
        
        if bab.filter({!$0.isWhitespace}) == "" {
            answer += 1
        }
    }
    
    return answer
}


var tessss:String = "adfes"
var tsse = String(tessss.prefix(1))


func gcd(_ a: Int, _ b: Int) -> Int {
    let mod: Int = a % b
    return 0 == mod ? min(a, b) : gcd(b, mod)
}

print(gcd(8,12))



let binary:String = String(45 ,radix: 3)
var numArr: [String] = binary.map { String($0) }.sorted()

var ddfdf = Int(NSDecimalNumber(decimal: pow(3, 3)))
print(ddfdf)
print(type(of: pow(3, 3)))


let flipToThree = String(45,radix: 3)
let answer = Int(String(flipToThree.reversed()),radix:3)!

print(flipToThree)
print(answer)


print("""
  _                    _           _ _ 
 | |__   __ _ ___  ___| |__   __ _| | |
 | '_ \\ / _` / __|/ _ \\ '_ \\ / _` | | |
 | |_) | (_| \\__ \\  __/ |_) | (_| | | |
 |_.__/ \\__,_|___/\\___|_.__/ \\__,_|_|_|

""")


var strr:String = "asdf fsDs a fe"

var lass: [ String ] = strr.map { String($0).uppercased() }


func solution(_ number:[Int]) -> Int {
    var answer:Int = 0
    var length:Int = number.count - 1
    
    for idx1 in 0...length - 2 {
        for idx2 in (idx1 + 1)...length - 1 {
            print("돌아간다 : ", idx2)
            for idx3 in (idx2 + 1)...length {
                print(number[idx1],"+" , number[idx2],"+", number[idx3])
                if number[idx1] + number[idx2] + number[idx3] == 0 {
                    
                    answer += 1
                    
                }
            }
        }
    }
    
    return answer
}

solution([-2, 3, 0, 2, -5])
solution([-3, -2, -1, 0, 1, 2, 3])
solution([-1, 1, -1, 1])
