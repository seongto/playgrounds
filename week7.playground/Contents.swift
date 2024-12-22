import Foundation




struct Queue<T> {
    var queue: [T?] = []
    var head: Int = 0 // 현재 nil이 아닌 가장 앞의 index 값을 명시
    
    var capacity: Int {
        return queue.capacity
    }
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        sizeManager()
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        
        queue[head] = nil
        head += 1
        
        if head > 1000 {
            queue.removeSubrange(0..<head)
            head = 0
        }
        
        return element
    }
    
    /// count가 100 이상일 경우 nil 값의 비율에 따라 배열 길이를 조정
    mutating func sizeManager() {
        if count >= 100 {
            if head >= count * 3 / 4 {
                queue.removeSubrange(0..<count/2 - 1)
                head = head - (count / 2)
            }
        }
    }
}

/// capacity를 고려하고 append 등을 사용하지 않고 순환 버퍼로 최적의 성능을 추구하는 큐
struct CapQueue<T> {
    private var array: [T?] // 큐 내부 데이터를 저장
    private var head: Int   // 큐의 첫 번째 요소 인덱스
    private var capacity: Int // 최대 용량. 초기값을 그냥 16 정도로 주고 시작하기
    
    // 현재 요소 개수 : 삭제된 값 뿐만 아니라 capacity 증가에 따른 nil 추가로 인해 array.count로 실제 데이터 추적이 어려운 구조.
    private var size: Int = 0 // 현재 실제 사이즈를 가지고 있음.

    init(initialCapacity: Int = 16) {
        self.capacity = max(1, initialCapacity)
        self.array = Array(repeating: nil, count: capacity)
        self.head = 0
    }

    var isEmpty: Bool {
        return size == 0
    }

    var isFull: Bool {
        return size == capacity
    }

    /// 큐에 요소 추가
    mutating func enqueue(_ element: T) {
        if isFull {
            resize()
        }
        
        let tailIndex = (head + size) % capacity
        
        array[tailIndex] = element
        size += 1
    }

    /// 큐에서 요소 제거 및 반환
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        let element = array[head]
        
        array[head] = nil // 메모리 관리 차원에서 요소 제거
        head = (head + 1) % capacity
        size -= 1
        
        return element
    }

    /// 큐의 첫 번째 요소 반환 (제거하지 않음)
    func peek() -> T? {
        guard !isEmpty else { return nil }
        
        return array[head]
    }

    /// 큐 크기를 두 배로 늘림
    private mutating func resize() {
        let newCapacity = capacity * 2
        var newArray = Array<T?>(repeating: nil, count: newCapacity)
        
        for i in 0..<size {
            newArray[i] = array[(head + i) % capacity]
        }
        
        head = 0
        capacity = newCapacity
        array = newArray
    }
}


struct Stack<T> {
    var stack: [T] = []
    
    var count: Int {
        return stack.count
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        stack.append(element)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : stack.removeLast()
    }
}



func getFair(_ s:String) -> Bool {
    var chars = Stack<Character>()
    
    for char in s {
        if char == "(" {
            chars.enqueue(char)
        } else {
            if chars.isEmpty || chars.stack.last == char {
                return false
            } else {
                chars.dequeue()
            }
        }
    }
    
    return chars.isEmpty ? true : false
}



//getFair("()()")
//getFair("(())()")
//getFair(")()(")
//getFair("(()(")




func getCode(_ s:String, _ skip:String, _ index:Int) -> String {
    var answer: String = ""
    var alphabets: String = "abcdefghijklmnopqrstuvwxyz"
    
    skip.forEach {
        alphabets = alphabets.replacingOccurrences(of: String($0), with: "")
    }
        
    var arr: [Character] = alphabets.map { $0 }
    
    print(arr)
                
    for _ in 1...index / arr.count + 1 {
        arr += arr
    }
    
    s.forEach {
        var idx: Int = arr.firstIndex(of: $0)!
        idx += index
        
        answer += String(arr[idx])
    }
    
    return answer
}


func getSubstr(_ string: String, from: Int, to: Int) -> Substring {
    let startIndex = string.index(string.startIndex, offsetBy: from)
    let endIndex = string.index(string.startIndex, offsetBy: to)
    let substring = string[startIndex...endIndex]
    
    return substring
}

func goPark(_ park:[String], _ routes:[String]) -> [Int] {
    var newPark: [String] = park
    var cx: Int = 0
    var cy: Int = 0
    var width: Int = park[0].count
    var height: Int = park.count
    var startFound: Bool = false
    
    for y in 0..<height {
        if park[y].contains("S") {
            print(park[y])
            for x in park[y].enumerated() {
                if x.1 == "S" {
                    cx = x.0
                    cy = y
                    startFound = true
                    break
                }
            }
            newPark[y] = park[y].replacingOccurrences(of: "S", with: "O")
        }
        if startFound { break }
    }
    
    print("\(cx), \(cy)")
    print(newPark)
    
    func moveE(_ distance: Int){
        if cx + distance < width {
            var rest = getSubstr(newPark[cy], from: (cx + 1), to: cx + distance)
            if rest == String(repeating: "O", count: distance) {
                cx += distance
            }
        }
    }
    
    func moveW(_ distance: Int){
        if cx - distance >= 0 {
            var rest = getSubstr(newPark[cy], from: cx - distance, to: cx - 1)
            if rest == String(repeating: "O", count: distance) {
                cx -= distance
            }
        }
    }
    
    func moveS(_ distance: Int) {
        var strIdx = newPark[0].index(newPark[0].startIndex, offsetBy: cx)
        if cy + distance < height {
            for i in cy...cy + distance {
                if newPark[i][strIdx] == "X" {
                    return
                }
            }
            cy += distance
        }
    }
    
    func moveN(_ distance: Int) {
        var strIdx = newPark[0].index(newPark[0].startIndex, offsetBy: cx)
        if cy - distance >= 0 {
            for i in cy - distance...cy {
                if newPark[i][strIdx] == "X" {
                    return
                }
            }
            cy -= distance
        }
    }
    
    
    routes.forEach {
        var temp = $0.split(separator: " ")
        
        switch temp[0] {
        case "E":
            moveE(Int(temp[1])!)
        case "W":
            moveW(Int(temp[1])!)
        case "S":
            moveS(Int(temp[1])!)
        case "N":
            moveN(Int(temp[1])!)
        default:
            print("error?")
        }
    }
    
    return [cy, cx]
}

//var str1 = "1234"
//var str2 = getSubstr(str1, from: 1, to: 3)
//
//print(str2)
//print(type(of: str2))
//
//var str3 = "234"
//print(type(of: str3))
//
//print(str2 == str3)
//
//str1 = ""
//print(str2)

//var arr1 = [1,2,3,4]
//var arr2 = arr1[1...2]
//
//print(arr2)
//print(type(of: arr2))
//print(arr2[1])
//
//var arr3 = [2,3,4]
//print(type(of: arr3))
//
//print(arr2.removeLast())
//print(arr2)
//print(type(of: arr2))
//print(arr1)


//var str4 = "1234567890"
//var strIdx = str4.index(str4.startIndex, offsetBy: 3)
//
//print(strIdx)
//print(str4[strIdx])
//
//var str5 = "123456"
//var strIdx2 = str5.index(str5.startIndex, offsetBy: 3)
//
//print(strIdx2)
//print(str5[strIdx])
//
//print(strIdx == strIdx2)


func getReport(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var answer: [Int] = []
    var reports = Set(report)
    var count: [String:Int] = [:]
    var reporters: [String:[String]] = [:]
    
    reports.forEach {
        var arr = $0.split(separator: " ").map { String($0)}
        reporters[arr[1], default: []].append(arr[0])
    }
    
    reporters.forEach {
        if $0.value.count >= k {
            for who in $0.value {
                count[who, default: 0] += 1
            }
        }
    }
    
    id_list.forEach {
        answer.append(count[$0, default: 0])
    }
    
    
    return answer
}


func getMaxMin(_ s:String) -> String {
    var arr: [Int] = s.split(separator: " ").map { Int($0)!}
    var maxNum: Int = arr[0]
    var minNum: Int = arr[0]
    
    arr.forEach {
        maxNum = max($0, maxNum)
        minNum = min($0, minNum)
    }
    
    return "\(minNum) \(maxNum)"
}


func getJaden(_ s:String) -> String {
    var arr: [String] = s.split(separator: "").map {String($0)}
    var isFirst: Bool = true
    var result: String = ""
    
    arr.forEach {
        if $0 == " " {
            isFirst = true
            result += $0
        } else {
            if isFirst {
                result += $0.uppercased()
                isFirst = false
            } else {
                result += $0.lowercased()
            }
        }
    }
    
    return result
}


func get2num(_ s:String) -> [Int] {
    var result: String = s
    var count: Int = 0
    var removed: Int = 0
        
    while result != "1" {
        var after: String = result.filter { $0 == "1"}
        removed += result.count - after.count
                
        result = String(after.count, radix: 2)
        count += 1
    }
    
    return [count, removed]
}


func getPibo(_ n:Int) -> Int {
    
    var before2: Int = 0
    var before1: Int = 1
    var answer: Int = 1
    
    if n == 2 {
        return answer
    }
    
    for num in 3...n {
        before2 = before1
        before1 = answer
        answer = before1 + before2
    }

    return answer % 1234567
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

let people1:[Person] = [
    Person(
        name: "Brody",
        age: 20,
        toys: toyList,
        foods: foodList
    ),
    Person(
        name: "aDe",
        age: 21,
        toys: toyList,
        foods: foodList
    ),
]

//print(people1)

func testJson() {
    // 데이터를 json으로 바꾸기
    guard let jsonData = try? JSONEncoder().encode(people1) else {
        print("nilllllll")
        return
    }
    
//    print(jsonData)
    print("===============================")
    
    do {
        // json을 데이터로 바꾸기
        let people2:[Person] = try JSONDecoder().decode([Person].self, from: jsonData)
//        print(people2)
        
        print(people2[0].self)
        print(people2[0].name)
//        print(people1 === people2)
    } catch {
        print("JSON 디코딩 실패")
    }
}

testJson()



// 1. Protocol 정의 (위임할 동작 정의)
protocol TaskDelegate: AnyObject {
    func taskDidStart()
    func taskDidFinish()
}

// 2. Delegator (작업을 위임하는 객체)
class TaskManager {
    weak var delegate: TaskDelegate? // Delegate를 약한 참조로 선언 (순환 참조 방지)

    func startTask() {
        
        print("Task 시작")
        delegate?.taskDidStart() // Delegate에 작업 시작 알림
    }
}

// 3. Delegate (작업을 위임받는 객체)
class TaskHandler: TaskDelegate {
    func taskDidStart() {
        print("Delegate: 작업 시작을 감지했습니다.")
    }

    func taskDidFinish() {
        print("Delegate: 작업 완료를 감지했습니다.")
    }
}

// 4. 사용 예시
let taskManager = TaskManager()
let taskHandler = TaskHandler()

taskManager.delegate = taskHandler // Delegate 설정
taskManager.startTask()
