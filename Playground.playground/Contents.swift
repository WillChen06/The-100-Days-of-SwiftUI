import Cocoa

// Optional

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposites = opposites["Peach"]

if let marioOpposites = opposites["Mario"] {
    print("Mario's oppsosite is \(marioOpposites)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let number = number {
    print(square(number: number))
}

// Optional with guard
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}

// Nil coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Definat": "Sisko"
]

let new = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "Babylon5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number2 = Int(input) ?? 0
print(number2)

// Optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")


var book2: Book? = nil
let author2 = book2?.author?.first?.uppercased()

// Optional try
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// Checkpoint 9
func getRandom(array: [Int]?) -> Int {
    return array?.randomElement() ?? Int.random(in: 1...100)
}

let test: [Int]? = nil
getRandom(array: test)
