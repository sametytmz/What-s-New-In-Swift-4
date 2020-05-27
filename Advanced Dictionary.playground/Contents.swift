import UIKit


/*
    Advanced Dictionary
    Problem: Functional programming met Swift Dictionary
 */

//: ### Default Value
//: Your Past
var myInfo = ["name": "Samet Yatmaz", "age": "30"]
let name = myInfo["name"] // Optional("Samet Yatmaz")

//: Default Value for Dictionary
let footSize = myInfo["footsize", default: "No Value"]
let myName = myInfo["name", default: "No Value"] // "Name"


/*
    Practical Usage: Everywhere for accessing dictionary value
    Grouping a sequence into a dictionary
*/


let contacts = ["Julia", "Susan", "John", "Alice", "Alex"]
let grouped = Dictionary(grouping: contacts, by: { $0.first! })
print(grouped)


//: ### Remove Duplicates
let duplicates = [("a", 1), ("b", 7), ("a", 3), ("b", 10)]
let myLetter = Dictionary(duplicates, uniquingKeysWith: { (letter, number) in letter })
print(myLetter)

//: ### Zip (Dictionary Like)
let words = ["one", "two", "three", "four"]
let numbers = 1...words.count

for (word, number) in zip(words, numbers) {
    print("\(word): \(number)")
}

//: Zip to Dictionary
let friends = ["Hoy", "Dan", "Huy", "Adam"]
let friendsWithValue = Dictionary(uniqueKeysWithValues: zip(1..., friends))
print(friendsWithValue)


//: Functional Programming with Set
let set: Set = [1, 2, 3, 4, 5]
let filteredSet = set.filter { $0 % 2 == 0 } // Returns Set
type(of: filteredSet)
print(filteredSet)


//: Functional Programming to Dictionary
let dictionary = ["name": "Samet", "age": "15", "hairColor": "Black"]
let filtered = dictionary.filter { $0.key == "name" }

print(filtered)

let mapped = dictionary.mapValues { value in value.uppercased()}
print(mapped)
