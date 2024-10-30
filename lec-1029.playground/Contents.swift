import UIKit



// 푸드파이트 대회 코드
func solution(_ food:[Int]) -> String {
    var table:String = "0"
    
    var cooked:[Int] = food
    cooked.removeFirst()
    cooked.reverse()
        
    for (idx, v) in cooked.enumerated() {
        let dishNum:Int = v/2
        let dishOrder:Int = cooked.count - idx
        
        for _ in 1...dishNum {
            table = String(dishOrder) + table + String(dishOrder)
        }
    }
    
    return table
}

print(solution([1,3,8,5,2]))



// 함수 매개변수 클로저 테스트
print("---------- 함수 매개변수 클로저 테스트 ----------")
var playWithDog = {
    print("Fetch!")
}
func play(_ playType: () -> Void) -> String {
    print("Let's play a game")
    playType()
    return "bark"
}

play( playWithDog)



// 트레일링 클로저 테스트해보기
func trailTest(key:String, closure: () -> Void){
    print("test1")
    closure()
}


trailTest(key: "Hello", closure:{
    print("ok!")
})


// 배열 메소드 테스트 겸 Any 타입 시 컴파일러 작동 원할한지 체크 : Any 넣으면 플레이그라운드 작동 안함.
var arr1: [Int] = [1,2,3,4,5]
var arr2:Int = arr1.removeLast()
print(arr2)


print("hello")


// 클로저 내부 캡쳐링 테스트
func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    let incrementer: () -> Int = {
        total += incrementAmount
        return total
    }
    return incrementer
}

let incrementByTwo = makeIncrementer(incrementAmount: 2)
incrementByTwo() // 2
incrementByTwo() // 4




