import Foundation

/*
        Intro to Codable
        Problem: Map JSON to Object in a couple lines of code and the opposite
 */


// Your Past
enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}


let blogPost = """
{
    "post1": {
        "title": "The Complete Understanding of Delegate",
        "subtitle": "No more guessing",
        "markdown": "# Title",
        "author: "Samet Yatmaz",
        "tags: ["delegate", "object"]
    },
}
""".data(using: .utf8)! // our data in native (JSON) format

// Design Model before codable
struct Post {
    let title: String
    let subtitle: String
    let markdown: String
    let author: String
    let tags: [String]
    
    public init(json: [String: Any]) throws {
        guard let title = json["title"] as? String else {
            throw SerializationError.missing("title")
        }
        
        guard let subtitle = json["subtitle"] as? String else {
            throw SerializationError.missing("subtitle")
        }
        
        guard let markdown = json["markdown"] as? String else {
            throw SerializationError.missing("markdown")
        }
        
        guard let author = json["author"] as? String else {
            throw SerializationError.missing("author")
        }
        
        guard let tags = json["tags"] as? [String] else {
            throw SerializationError.missing("tags")
        }
        
        self.title = title
        self.subtitle = subtitle
        self.markdown = markdown
        self.author = author
        self.tags = tags
    }
}

// Design Model nowadays
struct User: Codable {
    var name: String
    var loginMethods: [LoginMethods]
    var numberOfFriends: Int
    
    enum LoginMethods: String, Codable {
        case facebook
        case instagram
        case linkedin
        case twitter
    }
}

struct AnotherUser: Codable {
    var fullName: String
    var loginMethods: [LoginMethods]
    var numberOfFriends: Int
    
    enum LoginMethods: String, Codable {
        case facebook
        case instagram
        case linkedin
        case twitter
    }
}


// Create Object
let samet = User(name: "Samet", loginMethods: [.facebook, .instagram, .linkedin], numberOfFriends: 4)
let newPerson = AnotherUser(fullName: "Kobe Bryant", loginMethods: [.instagram], numberOfFriends: 10000)
    
// Encode (Object to JSON)

// Create Encoder
let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = .prettyPrinted
var data: Data?


// Encode
do {
    let jsonData = try jsonEncoder.encode(samet)
    data = jsonData
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print("Person: " + jsonString)
    }
}


// Decode (JSON to Object)
// Create Decoder
let jsonDecoder = JSONDecoder()

// Decode
do {
    let samet = try jsonDecoder.decode(User.self, from: data!)
    print("Name: \(samet.name)")
    print("Number of friends: \(samet.numberOfFriends)")
} catch(let error) {
    print(error)
}


// Meaning of self
let userType = User.self
userType.init(name: "Samet", loginMethods: [.facebook], numberOfFriends: 3)


/*
    Note --> It has to look identical --> Less flexible
 */


// Another Example
struct Geek: Codable {
    let stackOverFlowId: String
    let name: String
    let platform: String
}

let geeks = """
[{
    "stackOverFlowId": "sametytmz",
    "name": "Samet",
    "platform": "iOS"
},
{
    "stackOverFlowId": "codemaster",
    "name": "Babylon",
    "platform": "Android"
},
{
    "stackOverFlowId": "fullstack",
    "name": "Alex",
    "platform": "Backend"
}]
""".data(using: .utf8)! // our data in native (JSON) format

// Data to Object (Encode)
do {
    let developers = try jsonDecoder.decode([Geek].self, from: geeks)
    developers.forEach { print($0) }
} catch(let error) {
    print(error)
}


// Create JSON in Dictionary

let geeksDict = """
{
    "1": {
        "stackOverFlowId": "sametytmz",
        "name": "Samet",
        "platform": "iOS"
    },
    "2": {
        "stackOverFlowId": "codemaster",
        "name": "Babylon",
        "platform": "Android"
    },
    "3": {
        "stackOverFlowId": "fullstack",
        "name": "Alex",
        "platform": "Backend"
    }
}
""".data(using: .utf8)! // our data in native format

// Data to Object (Encode)

do {
    let geeksDictionary = try JSONDecoder().decode([String: Geek].self, from: geeksDict)
    geeksDictionary.forEach{ print("\($0.key): \($0.value)") } // decoded!!!
} catch(let error) {
    print(error)
}
