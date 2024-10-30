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
print(type(of: dir2))

