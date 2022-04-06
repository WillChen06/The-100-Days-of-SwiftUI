import Cocoa

// Classes

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// Class inherit

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm developer who will sometimes work \(hours) hours a day, but other times will spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)

robert.work()
joseph.work()

// Initializer
class Vehicle {
    let isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible = false
}

let teslaX = Car(isElectric: true)

// Copy classes
class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"

print(user1.username)
print(user2.username)

// Deinitializer

class Person {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

var people = [Person]()

for i in 1...3 {
    let person = Person(id: i)
    print("User \(person.id): I'm in control!")
    people.append(person)
}

print("Loop is finish!")
people.removeAll()
print("Remove all!")

// Variables in classes

class User2 {
    var name = "Paul"
}

var user3 = User2()
user3.name = "Taylor"
user3 = User2()
print(user3.name)

// Checkpoint 7
class Animal {
    let legs: Int
    
    init(legs: Int = 4) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Dog barking.")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Corgi barking.")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poddle barking.")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("Cat meow.")
    }
}

class Perisan: Cat {
    override func speak() {
        print("Perisan meow.")
    }
}

class Lion: Cat {
    override func speak() {
        print("Lion roaring.")
    }
}

let dog = Dog(legs: 4)
dog.speak()

let corgi = Corgi()
corgi.speak()

let poodle = Poodle()
poodle.speak()

let cat = Cat(isTame: false)
cat.speak()

let persian = Perisan(isTame: true)
persian.speak()

let lion = Lion(isTame: false)
lion.speak()
