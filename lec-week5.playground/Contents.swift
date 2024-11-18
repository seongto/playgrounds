import Foundation

func getWords(_ number:String, _ k:Int) -> String {
    var count: Int = k
    var answer: [String] = []
    var numArr: [String] = Array(number.map { String($0)})
    
    for num in numArr {
        while answer.count > 0 && (answer.last! < num) && (count > 0) {
            answer.popLast()
            count -= 1
        }
        
        answer.append(num)
        print(answer)
    }
    
    var result: [String] = Array(answer[0...answer.count - k - 1])
    
    return result.joined()
}

getWords("9862199999", 4)
//getWords("1231234", 3)

