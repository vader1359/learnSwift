/*
 ---------------------------------
 THROWS THE ERROR - DO, TRY & CATCH
 ---------------------------------
 
 */
struct Friend {
    let name: String
    let age: String
    let address: String?
}

enum FriendError: Error {
    case invalidData(description: String)
    case someError
}

// Here it's required to return an actual friend, so no "-> Friend?"
func friend(from dict: [String : String]) throws -> Friend {
    guard let name = dict["name"] else {
        throw FriendError.invalidData(description: "Invalid name")
    }
    guard let age = dict["age"] else {
        throw FriendError.invalidData(description: "Invalid age")
    }
    
    let address = dict["address"]
    
    return Friend(name: name, age: age, address: address)
}

func send(message: String, to friend: Friend) {}

let response = ["name": "Pasan", "age": "28", "address": "someAddress"]
do {
    let myFriend = try friend(from: response)
    send(message: "Test", to: myFriend)
    // this print all the errors
    //} catch let error {
    //    print(error)
    
    // This way is to catch the invalidData error only
} catch FriendError .invalidData(let description) {
    // Inform user the input data is wrong
    print(description)
} catch FriendError .someError {}

/*
 -------------------
 DEFER STATEMENT
 -------------------
 */

// Defers statement is used to do some action after the error throws (like close the file)
// In spite of where it state, when the current scope close, the defer statement will be called
// Multiple defer statment will be called in REVERSE ORDER


//enum ReadError {
//    case invalidFile
//    case unableToReadLine
//}
//
//func process (file name: String) throws {
//    guard isValidFile(withName: name) else {
//        throw ReadError .invalidFile
//    }
//    lert file = open(filename: name)
//    
//    This is the defer statement, in spite of where it state, when the current scope close, the defer statement will be called
/*
 -------------------------------------------------------------------
     defer {
         close(fileName: name)
     }
 -------------------------------------------------------------------
 */

//    
//    guard let line = try file.readline() else {
//        ReadError .unableToReadLine
//    }
//}






















