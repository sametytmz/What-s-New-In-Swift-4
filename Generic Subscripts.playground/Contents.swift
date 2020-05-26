import UIKit

/*
    Generic Subscription
    Problem: Can Subscripts return T?
 */

 //: Your Past
struct WeekDays {
    private var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    subscript(index: Int) -> String {
        return self.days[index]
    }
}


//: JSON
struct JSON {
    private var storage: [String: Any]
    init(_ dictionary: [String: Any]) {
        self.storage = dictionary
    }
    
    subscript<T>(key: String) -> T? {
        return storage[key] as? T
    }
}


//: Create Object
let republicOfTurkey = JSON([
    "capital": "Ankara",
    "name": "Republic of Turkey",
    "population": 80000000
    ])

let turkeyCapital: String? = republicOfTurkey["capital"]
let turkeyName: String? = republicOfTurkey["name"]
let turkeyPopulation: String? = republicOfTurkey["population"]  // boom
let turkeyPopulationReal: Int? = republicOfTurkey["population"] // it is

//: > I don't recommend using 'Subscripts'.
