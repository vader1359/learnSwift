/*
 -------------------
 ARRAY
 -------------------
 */

var todo: [String] = ["Finish collections course", "Buy groceries", "Respond to emails"]

// Add the element to the end of the array
todo.append("Pick up dry cleaning")

// Concatenating two arrays
// => Using +

//* Cannot add a String to an array simply, we must do this
//todo + "Order book online" -> Error
todo += ["Order book online"]

// This array only has 5 elements
// -> todo[6] == ERROR

// Insert and Remove at ~
todo.insert("Pick Lo", at: 2)
todo.remove(at: 2)

// Count -> use for checking the Error todo[6]
todo.count


/*
 -------------------
 DICTIONARY
 -------------------
 */

// Insert: dictionaries["key"] = "value"
// Update: dictionaries.updateValue(value, key)

// 2 ways to remove
// - set the ["key"] = nil
// - dictionaries.remove(key)







