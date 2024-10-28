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

