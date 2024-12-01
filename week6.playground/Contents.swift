import Foundation
import Testing

func getDfs(_ numbers:[Int], _ target:Int) -> Int {
    var answer: Int = 0
    let childs: [Int] = [1, -1]
    
    func dfsRecur(current: Int, depth: Int) {
        if depth >= numbers.count {
            print("\(current) \(depth)")
            
            if current == target {
                answer += 1
            }
            return
        }
        
        var cur:Int = current
        
        for num in childs {
            cur += numbers[depth] * num
            dfsRecur(current: cur, depth: depth + 1)
        }
    }
    
    dfsRecur(current: 0, depth: 0 )
    
    return answer
}

//getDfs([4,1,2,1], 4)


//func getTickets(_ tickets:[[String]]) -> [String] {
//    var answer: [String] = []
//    
//    func recursive( count: Int, rest: [[String]], visited: [String]){
//        if count == 0 {
//            if visited.count == tickets.count + 1 {
//                if answer.count == 0 {
//                    answer = visited
//                } else if answer != visited {
//                    for i in 1..<visited.count {
//                        if visited[i] < answer[i] {
//                            answer = visited
//                            break
//                        } else if visited[i] > answer[i] {
//                            break
//                        }
//                    }
//                }
//            }
//            
//            return
//        }
//        
//        if rest.count != count {
//            return
//        }
//        
//        for ticket in rest {
//            var tempRest: [[String]] = rest
//            var tempVisited: [String] = visited
//            
//            if tempVisited.last == ticket[0] {
//                tempVisited.append(ticket[1])
//                tempRest.remove(at: Int(rest.firstIndex(of: ticket)!))
//            }
//            
//            recursive(count: count - 1, rest: tempRest, visited: tempVisited)
//        }
//        
//    }
//    
//    recursive(count: tickets.count, rest: tickets, visited: ["ICN"])
//        
//    return answer
//}

func getTickets(_ tickets:[[String]]) -> [String] {
    var ticketDict: [String: [String]] = [:]
    
    tickets.forEach { ticket in
        ticketDict[ticket[0], default: []].append(ticket[1])
    }
    
    var answer: [String] = []
    
    func recursive( count: Int, rest: [[String]], visited: [String]){
        if count == 0 {
            if visited.count == tickets.count + 1 {
                if answer.count == 0 {
                    answer = visited
                } else if answer != visited {
                    for i in 1..<visited.count {
                        if visited[i] < answer[i] {
                            answer = visited
                            break
                        } else if visited[i] > answer[i] {
                            break
                        }
                    }
                }
            }
            
            return
        }
        
        if rest.count != count {
            return
        }
        
        for ticket in rest {
            var tempRest: [[String]] = rest
            var tempVisited: [String] = visited
            
            if tempVisited.last == ticket[0] {
                tempVisited.append(ticket[1])
                tempRest.remove(at: Int(rest.firstIndex(of: ticket)!))
            }
            
            recursive(count: count - 1, rest: tempRest, visited: tempVisited)
        }
        
    }
    
    recursive(count: tickets.count, rest: tickets, visited: ["ICN"])
        
    return answer
}


//getTickets([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]])
//getTickets([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]])


func getIron(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var attack = [Int](repeating: 0, count: number+1)

        for i in 1...number {
            var c = i

            while c <= number {
                attack[c] += 1
                c += i
            }
        
            print("i: \(i), \(attack)")
        }
    
    attack = attack.map { $0 > limit ? power : $0 }
    return attack.reduce(0, +)
}

//getIron(5, 3, 2)
//getIron(10, 3, 2)
//getIron(15, 10, 1)
//getIron(40, 2, 1) // 52
//getIron(5, 2, 1) // 8
//getIron(100000, 2, 1) // 109592
//getIron(100000, 50, 25) // 1115014
//getIron(1,2,1) // 1
getIron(29,5,3) // 86
