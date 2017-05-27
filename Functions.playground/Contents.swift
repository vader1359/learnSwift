/*
 -------------------
 DEFAULT PARAMETER
 -------------------
 */

func carpetCostHaving(length: Int, width: Int, carpetColor color: String = "blue") -> Int {
    // Gray carpet - $1/sq ft
    // Tan carpet - $2/sq ft
    // Deep BLue carpet - $4/sq ft
    
    let areaOfRoom = length * width
    
    var price = 0
    
    switch color {
        case "gray": price = areaOfRoom * 1
        case "tan": price = areaOfRoom * 2
        case "blue": price = areaOfRoom * 4
        default: price = 0
    }
    
    return price
}

// By setting the default value as "blue" in the parameter part, we have one more "constructor" of this function with the "blue" color is default
// => let carpet = carpetCostHaving(length: <#T##Int#>, width: <#T##Int#>)

// Of course, this still can be set by this basic "constructor"
// let carpet = carpetCostHaving(length: <#T##Int#>, width: <#T##Int#>, carpetColor: <#T##String#>)

/*
 -------------------
 TUPLE: a way to return multiple value in result with function
 -------------------
 */

// This method return tuple (c, d) as the result
// REMEMBER: Always use label for the tuple result -> much easier
func returnTuple(havingValue valueA: String, havingValue valueB: String) -> (resultA: String, resultB: String) {
    let resultA = valueA + "tuple"
    let resultB = valueB + "tuple"
    return (resultA, resultB)
}

// Return a tuple
let tuple = returnTuple(havingValue: "hello", havingValue: "world")
// Get different value from the tuple using name
let ac = tuple.resultA
let ad = tuple.resultB


















