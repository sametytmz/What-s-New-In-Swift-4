import UIKit

/*
    Key Paths
    Problem: I'm tired of chaining
 */

//: Design Model
struct Developer {
    var platform: Platform
    var information: Information
}

enum Platform {
    case iOS
    case android
}

struct Information {
    var name: String
    var strengths: String
    var motivation: String
}


//: Create Objects
let sametInformation = Information(name: "Samet", strengths: "Zenness", motivation: "Live your every day like your last day")
let steveInformation = Information(name: "Jobs", strengths: "Dryness and Zenness", motivation: "Change the world")

let samet = Developer(platform: .iOS, information: sametInformation)
let steve = Developer(platform: .iOS, information: steveInformation)

//: Your past
samet.information.motivation
samet.information.name // "Samet"
steve.information.name // "Jobs"

/*
    Introduction Swift 4 Key Paths
    Access Through "Path"
 */

let sametPlatform = samet[keyPath: \Developer.platform] // iOS
let steveName = steve[keyPath: \Developer.information.name] // "Jobs"

//: Strore Path
let informationKeyPath = \Developer.information
let sametInfo = samet[keyPath: informationKeyPath].name
let steveInfo = steve[keyPath: informationKeyPath].motivation
//: Append Key Path
let nameKeyPath = informationKeyPath.appending(path: \.name)
samet[keyPath: nameKeyPath]
steve[keyPath: nameKeyPath]
