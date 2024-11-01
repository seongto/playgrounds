


var str:String = "+12345"

let bbb:Int = Int(str)!
print(bbb)

var aaaa:Character = str.remove(at: str.startIndex)

print(str)
print(aaaa)


// enum & switch의 연관값 테스트
enum DeliveryStatus {
    case ordered
    case shipping(tNumber: String)
    case deliveryCompleted(date: String)
}

let status:DeliveryStatus = .shipping(tNumber: "123000")

switch status {
case .ordered:
    print("주문완료")
case .shipping(let tNumber):
    print("tracking number : \(tNumber)")
case .deliveryCompleted(let date):
    print("배송완료 : \(date)")
}

print(status)


// 클래스 테스트
class Person {
    var name: String
    var age: Int
    
    var isAdult: Bool {
        get {
            return age >= 20
        }
        set {
            print("Person isAdult setter 코드블록 호출됨")
            if newValue == true {
                age = 20
            } else {
                age = 19
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Child: Person { // Child class를 정의합니다. Person class를 상속받습니다.
    override var name: String {
        willSet {
            print("Child name 변경 예정 : \(newValue)")
        }
        
        didSet {
            print("Child name 변경 완료 : \(oldValue)")
        }
    }
    
    override var isAdult: Bool {
        willSet {
            print("Child isAdult 변경될 예정")
        }
    }
}

let child = Child(name: "시작이름", age: 1)
child.isAdult = false
child.name = "변경이름"



// struct, class 에서 타입 메소드 사용 방법
struct Person2 {
    static var structName = "Person"
    var name: String = "Default Name"
    var age: Int = 15
    
    func introduce() -> String {
        return "안녕하세요. 제 이름은 \(name)이고, 나이는 \(age)살 입니다."
    }

    static func introduceType() -> String {
        structName = "A" // 오류 발생! 저장 프로퍼티에는 접근할 수 없어요!
        return "안녕하세요. 저는 \(structName) 타입입니다."
    }
}

print(Person2.introduceType())
