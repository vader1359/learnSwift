/*
 -------------------
 INITIALIZATION **
 -------------------
 */

// Initialization is a process of correctly preparing an initial value for stored properties before it is used.

// Convention: Init requires label for argument for calling later. To avoid this, use _label
//

// This is a case one stored property of the init is optional
class SurveyQuestion {
    let text: String
    var response: String? // Optional here. **This must be var as the variable will be changed later**
    
    init(text: String) { // THe init just need the text, not response
        self.text = text
    }
    
    func ask() {
        print(text)
        
    }
}

let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()

// Here we can add info to the nil property
beetsQuestion.response = "It's nice"

// => If the property has default value or is an optional -> No need to have init label

/*
 -------------------
 FAILABLE INITIALIZER
 -------------------
 */

// In many cases, the properties needed for a class might not be there. It may depends on external source (internet)
// If there is no source -> Cannot create class
// => Failable Initializer ~ init?() {} ~ deals with those cases

enum Day: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

let day = Day(rawValue: 4)

// Failable & Throwing Inits

enum PersonError: Error {
    case invalidData
}

class Person {
    let name: String
    let age: Int
    
    init(dict: [String: AnyObject]) throws {
        // Chain of optional binding using guard
        guard let name = dict["name"] as? String, let age = dict["age"] as? Int else {
            //  return nil
            // Instead of return nil (using init?), we can throw an error here
            throw PersonError.invalidData // => THis way is not good, as the program will crash. The nil should be used to handle the case.
        }
        self.name = name
        self.age = age
    }
    
    
    // We also have init() throws {} -> Used for handle the nil property of init
    
}

//let person = Person(dict: ["Lo", 18])

/*
 -------------------
 InIT DELEGATION - VALUE TYPES
 -------------------
 */

// A initializer can call other initializers as a part of it -> This can extend the initializer using the old one

// ** For value type, initializer delegation is simple. However, for class type, the child initializer take the burden of satisfying all parent's stored property

struct Point {
    var x: Int = 0
    var y: Int = 0
}

struct Size {
    var width: Int = 0
    var height: Int = 0
}

struct Rectangle {
    var origin = Point()
    var size = Size ()
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(x: Int, y: Int, height: Int, width: Int) {
        let origin = Point(x: x, y: y)
        let size = Size(width: width, height: height)
        
        self.init(origin: origin, size: size)
        
        // Base on these 2 variables, we can create many many constructor for this class/struct
    }
}

//Rectangle(origin: <#T##Point#>, size: <#T##Size#>)





