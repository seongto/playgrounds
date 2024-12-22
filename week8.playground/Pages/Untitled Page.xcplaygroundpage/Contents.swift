import Cocoa


func getGcf(_ a: Int, _ b: Int) -> Int {
    var rest: Int = 0
    var aa: Int = max(a, b)
    var bb: Int = min(a, b)
    
    while bb != 0 {
        rest = aa % bb
        aa = bb
        bb = rest
    }
    
    return aa
}

func getMul(_ arr:[Int]) -> Int {
    var answer: Int = 1
    
    arr.forEach {
        answer = answer * $0 / getGcf(answer, $0)
    }
    
    return answer
}


func bfs(start: Int, graph: [[Int]], visited: inout [Bool]) {
    // 1️⃣ 큐 초기화
    var queue: [Int] = [start]
    visited[start] = true // 시작 노드 방문 처리
    
    while !queue.isEmpty {
        // 2️⃣ 큐에서 노드 꺼내기
        print("before : \(queue)")
        let node = queue.removeFirst()
        print("현재 노드: \(node)") // 현재 방문 중인 노드
        print("after: \(queue)")
        
        // 3️⃣ 인접한 노드 확인
        for adjacent in graph[node] {
            if !visited[adjacent] { // 방문하지 않은 노드라면
                queue.append(adjacent) // 큐에 추가
                visited[adjacent] = true // 방문 처리
            }
        }
        print(visited)
    }
    
}

var visited: [Bool] = [false, false, false, false, false, false, false, false, false, false]

bfs(start: 1, graph: [[], [2, 5], [1, 3, 4], [2], [2], [1, 6], [5, 7], [6, 8], [7, 9], [8]], visited: &visited)



print(0.1 + 1.1 == 1.2)
