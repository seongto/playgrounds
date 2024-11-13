import Foundation

var arrr:[String] = ["1","2","3"]

var number = arrr[0...0 + 1 - 1].joined()

print(type(of: number))




// 프로그래밍 적 사고

let martInventory: Dictionary = [ "우유" : 100, "아보카도" : 100 ]
func groceryMilkShopping(_ order:String) -> String {
    if martInventory["아보카도"]! > 0 {
        return "우유 6개"
    } else {
        return "우유 1개"
    }
}

groceryMilkShopping("마트가서 우유사오고 아보카도 있으면 6개 사와")





print(type(of: chars))


var chars = "FDfea"

if let char = chars.unicodeScalars.first {
    var num = char.value
    print(type(of: num))
    print(num + 4)
    if let sss = UnicodeScalar(num) {
        
        print(sss)
        print(type(of: sss))
        print(String(sss))
        print(type(of: String(sss)))
    }
    
    
}



protocol Something {
    var id: Int { get }
}

struct Toy: Something, Codable {
    let toy: String
    let id: Int
}

let foodList: [String] = [ "apple", "banana", "meat"]
let toyList: [Toy] = [Toy(toy: "car", id: 1), Toy(toy: "plane", id: 2), Toy(toy: "robot", id: 3)]


struct Person: Codable { // Codable을 채택한 Person 구조체를 선언합니다.
    let name: String
    let age: Int
    let toys: [Toy]
    let foods: [String]
}

let person = Person(
    name: "Brody",
    age: 20,
    toys: toyList,
    foods: foodList
)

if let jsonData = try? JSONEncoder().encode(person),
   let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString) // {"age":20,"name":"Brody"}
}


var numm:Int = 1


func sortThings(_ strings:[String], _ n:Int) -> [String] {
    var answer = strings.sorted{
        Array($0)[n] == Array($1)[n] ? $0 < $1 :  Array($0)[n] < Array($1)[n]
    }
    return answer
}


var strrrr = stride(from: 1, to: 10, by: 2)
var strrrrr = Array(strrrr)

print(strrrr)
print(type(of: strrrr))
print(strrrrr)
print(type(of: strrrrr))
