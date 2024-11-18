import Foundation

var arrr:[String] = ["1","2","3"]

var number = arrr[0...0 + 1 - 1].joined()


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



var chars = "FDfea"

if let char = chars.unicodeScalars.first {
    var num = char.value

    if let sss = UnicodeScalar(num) {
        
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
}


func hashTable(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var result: Int = 0
    
    var hashArray: [[Int]] = data.sorted {
        Array($0)[col - 1] == Array($1)[col - 1] ? Array($0)[0] > Array($1)[0] :  Array($0)[col - 1] < Array($1)[col - 1]
    }
    
    print(hashArray)
    
    for row in row_begin...row_end {
        print(row)
        var sum:Int = 0
        for idx in 0...(data[0].count - 1) {
            sum += hashArray[row - 1][idx] % row
        }
        if row == row_begin - 1 {
            result = sum
        } else {
            result = result ^ sum
        }
    }
    
    return result
}


func getWeights(_ weights:[Int]) -> Int64 {
    let sortedWeights = weights.sorted(by: > )
    var countMap: [Int: Int] = [:] // 무게별 등장 횟수를 기록
    var result = 0

    for weight in sortedWeights {
        print(countMap[weight])
        
        // 이전에 기록된 값 중 조건을 만족하는 경우를 확인
        result += countMap[weight, default: 0]               // w1 == w2
        result += countMap[weight * 2, default: 0]          // w1 * 4 == w2 * 2
        
        // w1 * 3 == w2 * 2
        if weight * 3 % 2 == 0 {
            result += countMap[weight * 3 / 2, default: 0]
        }
        
        // w1 * 4 == w2 * 3
        if weight * 4 % 3 == 0 {
            result += countMap[weight * 4 / 3, default: 0]
        }
        
        print(countMap[weight, default: 0])

        // 현재 무게를 해시맵에 기록
        countMap[weight, default: 0] += 1
    }

    return Int64(result)
}




func guessWhoWinGift(_ friends:[String], _ gifts:[String]) -> Int {
    var giftIndex: [String:Int] = [:]
    var giftToGet: [String:Int] = [:]

    // 선물지수 비교하여 선물 지급하기
    func indexCheck(_ name1: String, _ name2: String) -> Void {
        if giftIndex[name1]! > giftIndex[name2]! {
            giftToGet[name1]! += 1
        } else if giftIndex[name1]! < giftIndex[name2]! {
            giftToGet[name2]! += 1
        }
    }

    // 1. 개인의 선물지수 데이터 저장
    for name in friends {
        var plusIndex: Int = gifts.reduce(0) { $1.split(separator: " ")[0] == name ? $0 + 1 : $0 + 0}
        var minusIndex: Int = gifts.reduce(0) { $1.split(separator: " ")[1] == name ? $0 + 1 : $0 + 0}
        giftIndex[ name ] = plusIndex - minusIndex
        giftToGet[ name ] = 0
    }
    print(giftIndex)
    
    for name in friends {
        
    }

    // 2. 개인별 순회하며 다른 멤버와의 선물 관계성 계산
    for idx1 in 0..<friends.count-1 {
        for idx2 in idx1 + 1..<friends.count {
            let name1: String = friends[idx1]
            let name2: String = friends[idx2]
            let gift1to2: String = name1 + " " + name2
            let gift2to1: String = name2 + " " + name1

            if  gifts.contains(gift1to2) || gifts.contains(gift2to1) {
                var sum: Int = gifts.reduce(0) {
                    if $1 == gift1to2 {
                        return $0 + 1
                    } else if $1 == gift2to1 {
                        return $0 - 1
                    }
                    return $0
                }

                // 3. 선물 관계에 따른 다음달 받을 선물 계산하여 저장
                if sum > 0 {
                    giftToGet[name1]! += 1
                } else if sum < 0 {
                    giftToGet[name2]! += 1
                } else {
                    indexCheck(name1, name2)
                }

            } else {
                indexCheck(name1, name2)
            }
        }
    }

    return giftToGet.values.max()!
}


func guessWhoWinGift2(_ friends: [String], _ gifts: [String]) -> Int {
    var giftIndex: [String: Int] = [:]
        var giftToGet: [String: Int] = [:]
        var giftMap: [String: Int] = [:] // 선물 관계를 빠르게 조회하기 위한 딕셔너리

        // 1. 선물 관계를 딕셔너리에 저장
        for gift in gifts {
            giftMap[gift, default: 0] += 1
        }

        // 2. 개인의 선물 지수 계산
        for name in friends {
            let plusIndex = gifts.filter { $0.split(separator: " ")[0] == name }.count
            let minusIndex = gifts.filter { $0.split(separator: " ")[1] == name }.count
            giftIndex[name] = plusIndex - minusIndex
            giftToGet[name] = 0
        }

        // 3. 선물 관계를 계산하여 다음 달 받을 선물 계산
        for idx1 in 0..<friends.count - 1 {
            for idx2 in idx1 + 1..<friends.count {
                let name1 = friends[idx1]
                let name2 = friends[idx2]
                let gift1to2 = "\(name1) \(name2)"
                let gift2to1 = "\(name2) \(name1)"

                // 선물 관계 점수 계산
                let sum = (giftMap[gift1to2] ?? 0) - (giftMap[gift2to1] ?? 0)

                if sum > 0 {
                    giftToGet[name1]! += 1
                } else if sum < 0 {
                    giftToGet[name2]! += 1
                } else {
                    if giftIndex[name1]! > giftIndex[name2]! {
                        giftToGet[name1]! += 1
                    } else if giftIndex[name1]! < giftIndex[name2]! {
                        giftToGet[name2]! += 1
                    }
                }
            }
        }

        // 4. 최종 결과 반환
        return giftToGet.values.max()!
}

//guessWhoWinGift2( ["muzi", "ryan", "frodo", "neo"], ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"])



func getMid(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
        
        for command in commands {
            var slicedArray = Array(array[ command[0]...command[1] ])
            print(slicedArray)
            answer.append(slicedArray[command[2]])
        }
        
        return answer
}

//getMid([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])



func puzzleChal(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    var len: Int = diffs.count
        
    func calculateTime(_ lv: Int) -> Int64 {
        var sum: Int64 = Int64(times[0])
        
        for idx in 1..<len {
            let mul = diffs[idx] - lv
            if mul <= 0 {
                sum += Int64(times[idx])
            } else {
                sum += Int64(times[idx] + times[idx - 1]) * Int64(mul)
                sum += Int64(times[idx])
            }
        }
        
        return sum
    }
    
    var low = 1
    var high = diffs.max() ?? 0
    var answer = 0

    while low <= high {
        let mid = (low + high) / 2
        let time = calculateTime(mid)
        
        print("low: \(low), high: \(high), mid: \(mid), answer: \(answer)")
        if time <= limit {
            answer = mid // 조건을 만족하는 레벨 저장
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return answer
}



func getCards(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var is1First: Bool = false
    var card1Used: Int = -1
    var card2Used: Int = -1
    
    for idx in 0...goal.count - 1 {
        print(idx)
        if (card1Used < cards1.count-1) && (goal[idx] == cards1[card1Used + 1]) {
            card1Used += 1
        } else if (card2Used < cards2.count-1) && (goal[idx] == cards2[card2Used + 1]) {
            card2Used += 1
        } else {
            return "No"
        }
    }
    
    if (card1Used == cards1.count - 1) &&  (card2Used == cards2.count - 1){
        return "Yes"
    }
    
    
    return "No"
}




