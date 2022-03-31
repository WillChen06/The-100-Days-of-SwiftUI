import Cocoa

// For loop
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os)")
}

for i in 1...12 {
    print("The \(i) times table")
    
    for j in 1...12 {
        print("    \(j) * \(i) is \(j * i)")
    }
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += "hate"
}
print(lyric)

let names = ["a", "b", "c", "d"]
print(names[1...]) // ["b", "c", "d"]

// While
var countdown = 10

while countdown > 0 {
    print("\(countdown)")
    countdown -= 1
}

print("Blast off!")
let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
print("Critical hit!")

var number: Int = 10
while number > 0 {
    number -= 2
    if number % 2 == 0 {
        print("\(number) is an even number.")
    }
}

// Break & Continue
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_100 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// Checkpoints
/*
 The problem is called fizz buzz, and has been used in job interviews, university entrance tests, and more for as long as I can remember. Your goal is to loop from 1 through 100, and for each number:

 If it’s a multiple of 3, print “Fizz”
 If it’s a multiple of 5, print “Buzz”
 If it’s a multiple of 3 and 5, print “FizzBuzz”
 Otherwise, just print the number.
 */

let nums: [Int] = Array(1...100)
for num in nums {
    switch true {
    case num.isMultiple(of: 15):
        print("\(num) should print \"FizzBuzz\"")
    case num.isMultiple(of: 3):
        print("\(num) should print \"Fizz\"")
    case num.isMultiple(of: 5):
        print("\(num) should print \"Buzz\"")
    default:
        print("\(num) should print \"\(num)\"")
    }
}
