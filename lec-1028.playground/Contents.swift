import UIKit


// tuple 호출하는 거 확인하기
var person1:(name:String, age:Int, isMan:Bool) = ("John", 20, true)
var person2:(name:String, age:Int, isMan:Bool) = ("Jane", 2, false)

print(person1.1)
print(person2.isMan)


// switch fallthrough 다루어 보기
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


// 함수를 String 안에 \() 로 넣었을 때도 작동하는지 확인해보기
func myFunc() -> String{
    return "100"
}

print("myFunc()의 값 결과는 \(myFunc()) 이다")


// 함수 파라미터에 이름 없는 파라미터 넣어보기
func callName(_ name:String, _ age:Int) -> String {
    return "Hello, \(name) \(age)세"
}

print(callName("Swift", 3))


// 여러가지 array 메소드 활용해보기
var myArr:[String] = ["Swift", "SwiftUI", "SwiftUIKit"]

myArr.append("SwiftVisionKit")
myArr.insert("SwiftX", at: 0)

print(myArr)

var arr2 = myArr.sorted()
var arr3 = myArr.sorted()
print(arr2[0])



// if guard 다중 조건 테스트
func multipleConditionsExample(_ value1: Int?, _ value2: Int?, _ value3: Bool?) {
    guard let v1 = value1, v1 > 0,
          let v2 = value2, v2 < 100,
          let bool = value3, bool else {
        print("하나 이상의 조건이 맞지 않습니다.")
        return
    }
    
    print("모든 조건이 참입니다: v1=\(v1), v2=\(v2), bool=\(bool)")
}

multipleConditionsExample(1, 20, true as Bool)


// Dictionary 만들어보고 메소드 결과 확인해보기
var dict:[String:Int] = [
    "aNum":10,
    "bNum":20,
    "cNum":30
]

dict.removeValue(forKey: "aNum")

print(dict)


// 함수 매개변수 클로저 테스트
print("---------- 함수 매개변수 클로저 테스트 ----------")
var playWithDog = {
    print("Fetch!")
}
func play(_ playType: () -> Void) -> String {
    print("Let's play a game")
    playType()
    return "bark"
}

play( playWithDog)



// 푸드파이트 대회 코드
func solution(_ food:[Int]) -> String {
    var table:String = "0"
    
    var cooked:[Int] = food
    cooked.removeFirst()
    cooked.reverse()
        
    for (idx, v) in cooked.enumerated() {
        var dishNum:Int = v/2
        var dishOrder:Int = cooked.count - idx
        
        for i in 1...dishNum {
            table = String(dishOrder) + table + String(dishOrder)
        }
    }
    
    return table
}

print(solution([1,3,8,5,2]))



var myArr2:[Int] = [1,3,8,5,2]
var testResult:Any = myArr2.removeLast()

print(testResult)
