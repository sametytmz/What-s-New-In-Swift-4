//
//  OpenPublic.swift
//  Access Control
//
//  Created by Samet Yatmaz on 26.05.2020.
//  Copyright © 2020 Samet Yatmaz. All rights reserved.
//

import Foundation
import UIKit

//: ### open class UIViewController
class SametViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
    }
}


// RandomLibraryFromGitHub
public func A() {}
open func B(){}

// internal func C() {}
// override func B(){} // success
// override func A(){} // error

let RandomLibrary().C()
