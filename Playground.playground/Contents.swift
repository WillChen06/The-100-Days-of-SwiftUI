import Cocoa

// Bool
let goodDogs = true
var gamOver = false
print(gamOver)
gamOver.toggle()
print(gamOver)
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)

isAuthenticated = !isAuthenticated
print(isAuthenticated)

// Join strings together
let firstPart = "Hello, "
let secondPart = "World"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + "gonna" + action

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let number = 11
let missionMessage = "Apollo" + String(number) + " landed on the moon"

print("5 x 5 is \(5*5)")
