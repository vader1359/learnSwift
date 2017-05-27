protocol FullNameable {
    // This protocol requires the struct/class conform it have a property called fullName
    // Create this variable + {get} / {set} is similar to the class initialization in Java
    // This create a constructor that force the conformed classs to have this property
    var fullName: String { get }
}

struct User: FullNameable {
    // The struct conform the fullName property
    var fullName: String
}
// the new user object embbeded with fullName "Constructor"
let user = User(fullName: "JohnSmith")

struct Friend: FullNameable{
    let firstName: String
    let middleName: String
    let lastName: String
    // The constructor can also be modified inside the struct
    // As long ass the property fullName: String is set, what fullName becomes, we don't need to care
    var fullName: String {
        return "\(firstName) \(middleName) \(lastName)"
    }
}

/*
 -----------------------------
 PROTOCOL VS OBJECT ORIENTED
 -----------------------------
 */

// When to use the Object Oriented???
// Active vs Passive
// Assume that we have Class Monster, a monster has "healthpoint" and can "attack" others
// We also have Cyclops, Behemoth, Hydra are 3 types of monsters
// => It's logical that Cyclops, Behemoth and Hydra are subclass of Monster, so they can have health points and can attack others
// => THIS IS ACTIVE ACTION AND SHOULD BE USED WITH OOP

// When to use the Protocol Oriented???
// THE PROTOCOLS CAN HANDLE MOST OF THE CASE    
// It can be noun, verb (active) and verb (passive or adjective)

// TYPE -> USING PROTOCOL
// Unit -> Use class & struct


/*
 -------------------
 PROTOCOL AS A TYPE
 -------------------
 */

// Assume we have an Blendable protocol
// We can do things like let ingredient: [Blendable] = [strawberry, chocolateMilk] if strawberry and chocolateMilk both conform Blendable. Even if they are different types


/*
 -------------------
 PROTOCOL INHERITANCE
 -------------------
 */

// By using Protocol Inheritance, we can add a different output for existed input without need to change the old method
// => Just add a new protocol inherit the previous one and add another format

protocol Printable {
    func description() -> String
}

struct PrintUser: Printable, Equatable {
    let name: String
    let age: Int
    let address: String
    
    func description() -> String {
        return "\(name), \(age), \(address)"
        
    }
    static func ==(lhs: PrintUser, rhs: PrintUser) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.address == rhs.address
    }
   }

let printUser = PrintUser(name: "Lo", age: 23, address: "someWhere")
let anotherPrintUser = PrintUser(name: "Lo", age: 23, address: "someWhere")

printUser == anotherPrintUser // return true

/*
 -------------------------------------------------------------------
||| UPDATING ||| GOOD PROTOCOL FROM APPLE: CAN DO, IS A, CAN BE
 -------------------------------------------------------------------
 */

// CAN DO GROUP

// This example is using the above example

// EQUATABLE: Check if two object are similar
// - First, conform the Equatable protocol in the struct of the object
// - Then, clarify the required function of the protocol (== func)
// - Finally, compare the objects
// Note that this static can also be applied to greater or less than cases
// Note that these type of protocol is named -able in the standard library

// Ex: 

//protocol Printable {
//    func description() -> String
//}
//
//struct PrintUser: Printable, Equatable {
//    let name: String
//    let age: Int
//    let address: String
//    
//    func description() -> String {
//        return "\(name), \(age), \(address)"
//        
//    }
//    static func ==(lhs: PrintUser, rhs: PrintUser) -> Bool {
//        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.address == rhs.address
//    }
//}
//
//let printUser = PrintUser(name: "Lo", age: 23, address: "someWhere")
//let anotherPrintUser = PrintUser(name: "Lo", age: 23, address: "someWhere")
//
//printUser == anotherPrintUser -> return true


// IS A GROUP -> NOT USE SO MUCH

// CAN BE -> HANDLE THE CONVERT

























