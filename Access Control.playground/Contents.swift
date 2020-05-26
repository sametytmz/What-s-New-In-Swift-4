import UIKit

/*
    Access Control
    Problem: I don't want you to touch my code
 */

/*
    Why is this important?
    1- Reduce indexing/compilation time while building an app
    2- Apple engineers do not want developers to touch their code, sometimes
    3- No need to overwhelm your teammates with unnecessary methods
 */

/* 5 Levels of Access Control
    1- Private (Most Secure)
    2- Fileprivate
    3- Internal
    4- Public
    5- Open (Least Secure)
 */

//: ### Private
//: Ex 1) Game Application
class Game {
    private var number = 0
    
    var score: Int {
        return number
    }
    
    func increaseNumberByOne() {
        number += 1
    }
}

// Game().number = 10
//: Ex 2) Singleton
class AccountManager {
    
    static let sharedInstance = AccountManager()
    var userInfo = (ID: "sametiosdev", Password: "istanbul34")
    private init() {}
}


//: ### Swift 4 Private Extension
class MyStatus {
    private var isHappy = true
}

extension MyStatus {
    func checkStatus() {
        print(isHappy)
    }
}

//: ### Private Setter Only
class NewGame {
    private(set) var score: Int = 0
    func increaseNumberByOne() {
        score += 1
    }
}



