import UIKit

/*
 Name: Vanessa Barnard
 Pennkey: vbarnard
 App Number: 1
 Looking Forward To: Finishing the minor and learning a little bit about mobile front end
 */

//Exercise 1
let foo : Int = 42
var fooStr : String? = String(foo)

print("My number is \(fooStr!)")

if let yourString = fooStr {
   print("My number is \(yourString)")
} else {
   print("There is no number")
}

print("My number is \(fooStr ?? "100")")



//Exercise 2
var charArr : [Character] = ["c", "i", "s", "1", "9", "5", " ", "i", "s", " ", "f", "u", "n"]

var newStr = String(charArr)
var updatedStr = newStr + String("!")
var someDict:[String:Int] = ["Jasmine":23, "Bianca":21, "Shanta":58]

print(dump(someDict))
var myInfo = ("Vanessa", 2021)
print(myInfo)



//Exercise 3
for entry in someDict{
    if entry.value < 21 {
        print("My friend \(entry.key) is under 21")
    } else {
        print("My friend \(entry.key) is not under 21")
    }
}

for num in 1...10 {
    print(num)
}

for cha in "cis195" {
    print(cha)
}



//Exercise 4
func sumAndDiff(x: Int, y: Int) -> (Int, Int) {
    let tup = (x+y, abs(x-y))
    return tup
}

typealias Course = String
typealias PennId = Int

func enroll(in course: Course, using pennId: PennId) {
    print("Enrolled \(String(pennId)) in \(course)")
}

let newCourse : String = "CIS195"
let myPennId : Int = 47708111
enroll( in: newCourse, using: myPennId)



//Exercise 5
struct Rectangle {
    var width = 0
    var length = 0
    
    var area: Int {
            get {
                return self.width * self.length
            }
        }
    var description: String? {
            willSet(des) {
                print(des ?? "No Description")
            }
        }
}

var myRect = Rectangle(width: 5, length: 10)

typealias OptionalSchool = String
typealias Major = String

class Student {
    var name : String
    var school : OptionalSchool
    var major : Major
    var undeclared = true
    
    init(name : String, school : OptionalSchool, major : Major) {
        self.name = name
        self.major = major
        self.school = school
       }
    
    init(name : String) {
        self.name = name
        self.major = "Electrical Engineering"
        self.school = "University of Pennsylvania"
       }
}
var me = Student(name: "Vanessa", school: "UPenn", major: "EE")
var babyQuaker = Student(name: "Jasmine")
    
let array = ["Econ", "Psych", "BBB", "Physics"]
let randomElement = array.randomElement()!
babyQuaker.major = randomElement



//Exercise 6
//Edited Rectangle above

myRect.description = "This is my rectangle."
print(String(myRect.area))
    
