import UIKit

// enum 타입에 대해 알아보기
enum Direction:String {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
}

var dir1:Direction = .south
var dir2:String = Direction.north.rawValue

print(dir1)
print(dir2)


enum DeliveryStatus {
    case ordered
    case shipping(tNumber: String)
    case deliveryCompleted(date: String)
}

let status:DeliveryStatus = .ordered

switch status {
case .ordered:
    print("주문완료")
case .shipping(let tNumber):
    print("tracking number : \(tNumber)")
case .deliveryCompleted(let date):
    print("배송완료 : \(date)")
}




// 1부터 n 까지의 Int 타입 모든 숫자를 element 로 갖는 배열
var arr:[Int] = Array(1 ... 10)

print(arr)


// 하노이탑 옮기는 방법
func hanoiSolution(_ n:Int) -> [[Int]] {
    var result:[[Int]] = []
    
    func hanoiMove(num:Int, tw1:Int, tw2:Int, tw3:Int){
        if num == 1 {
            result.append([tw1,tw3])
        } else {
            hanoiMove(num: num-1, tw1: tw1, tw2: tw3, tw3: tw2)
            result.append([tw1, tw3])
            hanoiMove(num: num-1, tw1: tw2, tw2: tw1, tw3: tw3)
        }
    }
    
    hanoiMove(num: n, tw1:1, tw2:2, tw3:3)
    
    return result
}

print(hanoiSolution(4))


var array1:[Int] = [1, 30, 4, 21, 100000];

print(array1.sorted())
