// Optional is used to handle the non-existence of data

struct Person {
    let firstName: String
    // Using the ? is making this type optinal -> this value can be nil
    // The optional will be wrapped in a "box", it needs to be unwrapped for using
    // Note: NEVER unwrap the Optional with ! - MUST use the Optional binding to handle it
    let middleName: String?
    let lastName: String
    
    func fullName() -> String {
        // NEVER DO THIS except being sure that the information is available there (Ex: picture embbeded as theme for the app)
        return firstName + " " + middleName! + " " + lastName
    }
}

let me = Person(firstName: "Lo", middleName: "Pig", lastName: "Stupid")

/*
 -------------------
 OPTIONAL BINDING with IF
 -------------------
 */

// Don't have JFK
let airportCodes = ["CDG": "Charles De Gaulle"]
// Call an nil element
let newYorkAirport = airportCodes["JFK"]

// This is optional binding, create a scoped variable newYorkAirport and test it with the JFK
// Optional Binding with if
// Note: Optional Binding with If should only be used in simple case with 1-2 conditions, or it will create a pyramid of doom
if let newYorkAirport = airportCodes["JFK"] {
    print(newYorkAirport)
} else {
    print("Whoops! That key does not exist!")
}

//** Dictionary case, we can do like this
let weatherDictionary: [String: [String: String]] = [
"currently": ["temperature": "22.3"],
"daily": ["temperature": "22.3"],
"weekly": ["temperature": "22.3"]
]

// This case, instead of creating a lot of "if let", we can just create new variable based on the previous passed variable
if let dailyWeather = weatherDictionary["daily"], let highTemperature = dailyWeather["temperature"] {
    print(highTemperature)
}

/*
 -------------------
 OPTIONAL BINDING with GUARD
 -------------------
 */
// Note: Using Optional Binding with Guard in the case that we need to satisfy some REQUIREMENTS
// guard is especially useful if there is just a few optional elements in the bundle

struct Friend {
    let name: String
    let age: String
    let address: String?
}
// The result can be optional depends on the input
func newFriend (friendDictionary:[String : String]) -> Friend? {
    // Use the guard to handle all the requirements for "not nil"
    // This example check if the name and age key is available, if not -> return nil
    guard let name = friendDictionary["name"], let age = friendDictionary["age"] else {
        return nil
    }
    
    // In case of not nill
    let address = friendDictionary["address"]
    return Friend(name: name, age: age, address: address)
}

//print(newFriend(friendDictionary: ["Pig" : "18"])!)

/*
 -------------------
 OPTIONAL CHAINING
 -------------------
 */

// In the case that there are too many possibly optional elements, we cannot use guard, or if let, the optional chain should be used

class Address {
    
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    
}

class Residence {
    var numberOfRooms = 1
    var address: Address?
    
}

class idPerson {
    var residence: Residence?
    
}

let susan = idPerson()

let address = Address()
address.street = "1234 Something Drive"
address.buildingName = "Building"
address.buildingNumber = "10"

let residence = Residence()
residence.address = address
susan.residence = residence

// This is the normal way. Using if let or guard, we need to check a lot of value whether it's nil or not to get the simple value (buildingNumber)
if let home = susan.residence, let postalAddress = home.address, let buildingNumber = postalAddress.buildingNumber, let convertedNumber = Int(buildingNumber) {
    print(convertedNumber)
}

// => Here, we should use Optional Chain
// This will respectively check every layer of the chain, until reaching the final value
let buildNumber = susan.residence?.address?.buildingNumber // return same value as above









































