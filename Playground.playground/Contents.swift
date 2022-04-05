import Cocoa

// Access control

/*
 Use private for “don’t let anything outside the struct use this.”
 Use fileprivate for “don’t let anything outside the current file use this.”
 Use public for “let anyone, anywhere use this.”
 */
struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// Static properties and methods

/*
 self -> The current value of a struct
 Self -> The current type of struct
*/
struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://ww.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String
    
    static let exmaple = Employee(username: "cfederighi", password: "idjqijweeqw")
}

// Checkpoint 6
struct Car {
    enum GearError: Error {
        case invalidGear
    }
    let model: String
    let seats: Int
    private(set) var gear: Int = 1
    
    mutating func changeGears(to grear: Int) throws {
        guard grear > 0 && grear <= 10 else {
            throw GearError.invalidGear
        }
        self.gear = grear
    }
}

var car1 = Car(model: "Benz", seats: 2)
try car1.changeGears(to: 2)
car1.gear
