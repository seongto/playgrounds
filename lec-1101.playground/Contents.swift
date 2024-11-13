
protocol Animal {
    func makeNoise()
}

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

class Cat: Animal {
    func makeNoise() {
        print("Meow!")
    }
}

let myDog: Animal = Dog()
let myCat: Animal = Cat()

myDog.makeNoise() // Woof!
myCat.makeNoise() // Meow!
