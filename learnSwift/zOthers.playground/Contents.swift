/*
 -------------------
 HELPER METHOD
 -------------------
 */

// This is a method used to support another method, for example: checkIf something is OK, then do the method
// The helper method
func isInRange(of enemy: String) -> Bool {
    return true
}

// The main method
// Notice that the helper method and the main method usually share parameters
func attack (at enemy: String) {
    var enem = enemy
    if isInRange(of: enemy) {
        enem += "die"
    } else {
        enem = "alive"
    }
    
}

/*
 -------------------
 CLASS WITHOUT INITIALIZATION: if we use the class with only "var" property, the default init is Class() => no need init. If we use let, then init must be coded
 -------------------
 */


/*
 -------------------
 OMIT THE EXTERNAL NAME: Ex: func move(_ direction: Direction)
 -------------------
 */

/*
 -------------------
 FUNCTION NAMING CONVENTION
 -------------------
 */

enum VendingSelection {
    case cookie
    case candy
}

func vend(_ selection: VendingSelection, quantity: Int) {}  // => This syntax read like: vend(.cookie, quantity: 5) => not like English
func vend(_ quantity: Int, of selection: VendingSelection) {} // => This syntax read like: vend(4, of: .soda) => not really good
func vend(_ quantity: Int, _ selection: VendingSelection) {} // => return vend(5, .cookie) => Good but the external label will be omitted -> difficult to maintain later


/*
 -------------------
 STATIC METHOD VS INSTANCE METHOD
 -------------------
 */

// If we just need to use the data stored once time -> Use the static method
// If we need to use the data more time -> Use an instance to store the data -> Use the instance method


/*
 -------------------
 OBJECT CASTING: is & as
 -------------------
 */

class Employee {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class HourlyEmployee: Employee {
    let hourlyWage: Double
    
    init(name: String, hourlyWage: Double) {
        self.hourlyWage = hourlyWage
        super.init(name: name)
    }
    
    func payWages(for hours: Double) -> Double {
        return hourlyWage * hours
    }
}

class SalariedEmployee: Employee {
    let salary: Double
    
    init(name: String, salary: Double) {
        self.salary = salary
        super.init(name: name)
    }
    
    func paySalary() -> Double {
        return salary/24
    }
}

let hourlyEmployee = HourlyEmployee(name: "Taylor", hourlyWage: 12.00)
let salariedEmployee = SalariedEmployee(name: "Lorenzo", salary: 62000)

// This arrays type is Employee, hourlyEmployee & salariedEmployee is subclass of Employees
// However, as the type is Employee, the element of this array cannot do each subtype method
let employees = [hourlyEmployee, salariedEmployee]

// CASTING using is and as
for employee in employees {
    // Check if the element is HourlyEmployee type
    if employee is HourlyEmployee {
        // Create a new variable to store the discovered employee value
        let hourlyEmployee = employee as! HourlyEmployee
        // Use the new variable to do the method of each subclass
        hourlyEmployee.payWages(for: 10.00)
    }
    
    if employee is SalariedEmployee {
        // The ! force the cast -> Should not be used
        // Here we should use the question mark ? -> the instance salariedEmployee is an optional instance of SalariedEmployee
        // Using if let or guard with as? for safer casting
        if let salariedEmployee = employee as? SalariedEmployee {
            //        salariedEmployee?.paySalary() -> This is optional chaining, this way is still OK
            salariedEmployee.paySalary()
        }
    }
}

/*
 -------------------
 FUNCTIONS WITH OPTIONAL ARGUMENT= NIL
 -------------------
 */
//func updateDisplayWith(balance: Double? = nil) {
//    balanceLabel.text = "$\(vendingMachine.amountDeposited)"
//    totalLabel.text = "$00.00"
//    priceLabel.text = "$0.00"
//}

// => There is no need to add the argument when calling the method




























