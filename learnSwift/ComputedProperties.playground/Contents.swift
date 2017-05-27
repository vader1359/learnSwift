/*
 -------------------
 COMPUTED PROPERTIES
 -------------------
 */

// Computed Properties can be used to replace function in many cases (no difference between these, just about the type)
// Prefer using computed properties instead of function

import UIKit

struct Point {
    var x: Int = 0
    var y: Int = 0
}

struct Map {
    static let origin = Point()
    
    static var x: Int {
        return origin.x
    }
}

struct Size {
    var width: Int = 0
    var height: Int = 0
    
}

struct Rectangle {
    //    let length: Int
    //    let width: Int
    //
    //
    //    // No need to use function, a store property can be treated like a function like this
    //    var area: Int {
    //        return length * width
    //    }
    
    // Use other struct to build this
    var origin = Point()
    var size = Size ()
    
    var center: Point {
        // There are 2 aspects of property (reading vs writing, get vs set)
        // This is like getter setter of Android
        
        // FIXME: Still not understand this get and set and the function of it
        
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            
            return Point(x: centerX, y: centerY)
        }
        
        set (centerValue) {
            origin.x = centerValue.x - size.width/2
            origin.y = centerValue.y - size.height/2
        }
    }
}

var rect = Rectangle()
print(rect.center)
rect.size = Size(width: 20, height: 15)
print(rect.center)
rect.center = Point(x: 10, y: 15)
print(rect.center)
print(rect.origin)

// Call the property
//let r1 = Rectangle(length: 10, width: 12)
//r1.area // Result is nice

/*
 -------------------------------------------
 A complex case using Computed Properties
 -------------------------------------------
 */

// Change theme of an app, should use computed properties as Theme is a property ??

// Use enum to store name of themes
enum ReadingMode {
    case day
    case evening
    case night
    
    // Each components of the theme, identify its UI type
    // Create each component variable as the property of the enum
    // Use switch to return suitable value based on the type
    var statusBarStyle: UIStatusBarStyle {
        switch self {
        case .day, .evening: return .default
        case .night: return .lightContent
        }
    }
    
    var headlineColor: UIColor {
        switch self {
        case .night: return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .day, .evening: return UIColor(red: 16/255.0, green: 16/255.0, blue: 16/255.0, alpha: 1.0)
        }
    }
    
    var dateColor: UIColor {
        switch self {
        case .day, .evening: return UIColor(red: 132/255.0, green: 132/255.0, blue: 132/255.0, alpha: 1.0)
        case .night: return UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
        }
    }
}

// The real element created on screen
let titleLabel = UILabel()
let date = UILabel()

// Create a funtion to connect the app to the enum (setTheme()) connect to the broad enum (ReadingMode)
func setupDisplay (with mode: ReadingMode) {
    // titleLabel.textColor returns UIColor -> match with headlineColor(return UIColor)
    titleLabel.textColor = mode.headlineColor
    date.textColor = mode.dateColor
}

// Call the method and choose the theme
// The properties will be computed
setupDisplay(with: .night)
setupDisplay(with: .day)


/*
 ------------------------
 Lazy Stored Properties
 ------------------------
 */

// Lazy stored properties can only be computed when being called by an instance
// The purpose is to save computation power, as many instance is expensive to call
// The lazy property cannot be constant or let, must be var

import Foundation
class ReadItLaterNetworkingClient {
    // No value will be assigned to this session property, until an instance call it
    lazy var session: URLSession = URLSession(configuration: .default)
    
    // Do other things
}

/*
 -------------------
 Property Observers
 -------------------
 */

// THis allow us to write code that is dependent on a changing property
// Cannot add observer to the lazy stored property

import PlaygroundSupport
import UIKit

class ViewController: UIViewController {
    
    let slider = UISlider()
    
    var value: Double = 0.0 {
        // didSet and willSet are 2 kinds of property observers
        willSet {
            // Call after changing a property value
            print("Old value: \(value)")
        }
        
        didSet {
            // Called immediately after assigning a value to hte stored property
            view.alpha = CGFloat(value)
            print("New value: \(value)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 30/255.0, green: 36/255.0, blue: 40/255.0, alpha: 1.0)
        
        // Add target-action pattern for value changed event
        slider.addTarget(self, action: #selector(viewController.slide(sender:)), for: .valueChanged)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Programmatically add constraints to setup layout
        view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.heightAnchor.constraint(equalToConstant: 30),
            slider.widthAnchor.constraint(equalToConstant: 400)
            ])
        
    }
    
    // Method for target-action
    @objc func slide(sender: UISlider) {
        value = Double(sender.value)
    }
    
}


let viewController = ViewController()
PlaygroundPage.current.liveView = viewController.view



























