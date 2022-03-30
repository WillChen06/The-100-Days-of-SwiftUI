import Cocoa

// Type Annotations
let surname: String = "Lasso"
var score2: Int = 0

let playerName2: String = "Roy"
var luckNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated2: Bool = true


var albums2: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities2: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark

let username: String
username = "@twostraws"
print(username)
