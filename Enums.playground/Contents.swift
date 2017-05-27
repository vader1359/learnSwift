// Enum is used for limit typing errors and a lot of other purposes in Swift
// This describe a FINITE list of a TYPE of things
import UIKit

enum Days {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

enum DayType {
    case weekend
    case weekday
}

// Use enum with for loop -> play roles as an array
// The enum can also be used as a type of Object
func dayType(for day: Days) -> DayType {
    switch day {
        // If lack of an element in the enum list -> ERROR
    case .saturday, .sunday: return .weekend
    case .monday, .tuesday, .wednesday, .thursday, .friday: return .weekday
    }
}

/*
 --------------------------------
 ASSOCIATED ENUMS & ENUM METHOD
 --------------------------------
 */
enum ColorComponent {
    // This is associated enum, a kind of constructor for enum value
    case rgb(red: Float, green: Float, blue: Float, alpha: Float)
    
    func color() -> UIColor {
        // switch self here = switch values in enum
        switch self {
            // Add variable to the case parameter as input data
        case .rgb(red: let red, green: let green, blue: let blue, alpha: let alpha):
            // Use the data to return the output for the method
            return UIColor(colorLiteralRed: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
        }
    }
}

    /*
     -------------------
     ENUM'S RAW VALUE
     -------------------
     */
    
    // Using raw value need to clarify the type of the enum raw value
    enum Coin: Double { // Raw value type Double
        case penny = 0.01
        case nickel = 0.05
        case dime = 0.1
        case quarter = 0.25
    }
    
    let coins: [Coin] = [.penny, .nickel, .dime, .dime, .quarter, .quarter, .quarter]
    
    func sum(having coins: [Coin]) -> Double {
        var total: Double = 0
        
        for coin in coins {
            // Instead of using switch, using the raw value is so much better
            //        switch coin {
            //            case .penny: total += 0.01
            //            case .nickel: total += 0.05
            //            case .dime: total += 0.1
            //            case .quarter: total += 0.25
            //        }
            
            // Depend on the case, the rawValue will be extracted from enum for using
            // Note that raw value can only be Premitive
            total += coin.rawValue
        }
        return total
    }
    
    //** RAW VALUE IN ENUM IS AUTO INCREMENTING
    
    enum Day: Int {
        // We just need to clarify the first case rawValue
        case sunday = 1
        case monday
        case tuesday
        case wedensday
        case thursday
        case friday
        case saturday
    }
    
    print(Day.friday.rawValue) // this will equals 6
    
    //** Note that using rawValue with String, we only need to provide the type String without providing the rawValue
    // the case name is the rawValue of that case
    enum HTTP: String {
        case post
        case get
        case put
        case delete
}



 // ** PASSING VARIABLE & ENUM'S RAWVALUE

enum HTTPStatusCode: Int {
    // Enums raw value is great when dealing with specific Dictionary like this
    case success = 200
    case forbidden = 403
    case unauthorized = 401
    case notFound = 404
}

let statusCode = 200
// if we pass a variable to the enum rawValue like this, the return will be optional
// => It can be not in the enum's case
// => MUST use guard or if let to handle this situation
if let httpStatusCode = HTTPStatusCode(rawValue: statusCode) {
    print(httpStatusCode)
}



















