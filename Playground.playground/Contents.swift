import Cocoa

// Function - default values
func printTimesTable(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5, end: 20)
printTimesTable(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

// Function - handle erros
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

// Checkpoint 4
enum SquareError: Error {
    case outOfBounds
    case noRoot
}

func getSquareRoot(number: Int) throws -> Int {
    guard number >= 1 && number <= 10_000 else { throw SquareError.outOfBounds }
    var result: Int?
    for i in 1...100 {
        if i * i == number {
            result = i
            break
        }
    }
    if let result = result {
        return result
    } else {
        throw SquareError.noRoot
    }
}


