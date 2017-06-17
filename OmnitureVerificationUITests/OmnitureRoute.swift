//
//  OmnitureRoute.swift
//  OmnitureVerification
//
//  Created by Derrick Ho on 6/17/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

import XCTest

/**
 A state can be considered a screen that isn't changing.  a state is idle until a button is clicked.
 
 Guidelines
 1) Create a new state object to invoke stateVerification.  You should not call it directly
*/

protocol OpenSettingsProtocol {
    var xctestcase: XCTestCase { get }
    func openSettings()
}
extension OpenSettingsProtocol {
    func openSettings() {
        // <-- tap OpenMenu via accessibility
    }
}

class Tray {var description = ""}

extension OmnitureState {
    @discardableResult
    func verify(block: (_ r: String, _ e: String) -> ()) -> Self {
        let (r, e) = stateVerification()
        block(r, e)
        return self
    }
}

class OmnitureState {
    let xctestcase: XCTestCase
    let beacon: (mmodule: String, mlink: String)
    init(xctestcase: XCTestCase
        , mmodule: String = ""
        , mlink: String = "")
    {
        self.xctestcase = xctestcase
        self.beacon = (mmodule, mlink)
    }
    
    /**
     compares the result to the expected string.  array-ifies the tray description.  anything that is deemed not a match will be added to the result and expected string.  a perfect match would mean result and expeted are empty strings
     */
    final func stateVerification() -> (result: String, expected: String) {
        //<-- verify that the current state is right aka pagename
        
        //<-- convert result from tray label into a sorted array.
        _ = arrayify("app tray label")
        //<-- convert expected tray object label into a sorted array
        _ = arrayify(expectedTray.description)
        
        //<-- each pair that do not match will be added to the result/expected string and then returned
        //<-- the xctestequal can compare these strings
        var _r = ""
        var _e = ""
        
        for (r, e) in zip([String](), [String]()) {
            if r != e { _r += r + ", "; _e += e + ", " }
        }
        // convert tray into a sorted array
        
        
        
        // for each element that do not match add it to the not matching set.  fail it.
        
        return (_r, _e)
    }
    
    private func arrayify(_ str: String) -> [String] {
        // this represents the tray value
//        var str = [
//            "name: bob"
//            , "count: m"
//            ].map({ "\"" + $0 + "\"" }).sorted().joined(separator: ", ")
        
        // convert string to data
        let d = "[\(str)]".data(using: .utf8)!
        // change data to array
        let arr = (try? JSONSerialization.jsonObject(with: d, options: [])) as? [String]
        return arr?.sorted() ?? []
    }
    
    open var expectedTray: Tray { return Tray() }
    
    internal func signOut_resetEnvironment_deleteContentFromUser(){}
}

////////////

class HomeState: OmnitureState, OpenSettingsProtocol {
 
    override var expectedTray: Tray {
        //<-- verify home-screen
        return Tray()
    }
    
    func tapMyMeds() {
        //<-- tap My meds
        //<-- if online send beacon to next page
        
        //<-- if offline go popUp Route
    }
}

class SettingsState: OmnitureState {
    override var expectedTray: Tray {
        //<-- verify settings screen
        return Tray()
    }
    func tapRow(accessibilityId: String) {/*...*/}
    
    
    func tapMyMeds() {//<-- should i use this or make it a part of the tapRow(accessibility function....
        tapRow(accessibilityId: "mymeds")
        //<-- if online send beacon to next page
        
        //<-- if offline go popUp Route
    }
}

/////////////

class MyMedsState: OmnitureState {
    override var expectedTray: Tray {
        //<-- verify MyMeds page name with beacon attributes
        return Tray()
    }
    func goBackToHome() {
        //<-- if left bar button item is OpenSettings then go home via settings manipulation
        
        //<-- otherwise tap the back button on navigation bar to get home
    }
}

/////////////

class LoginPopUpState: OmnitureState {
    override var expectedTray: Tray {
        //<-- verify module
        return Tray()
    }
    func tapCancel() {
        //<-- tap cancel and verify module and link
        // Question.... does dismissing cancel fire the home/settings pagename again?  I think not because you fired a module to get to the pop up state, why would we need to fire a pagename when it vanishes?  I think module when pop up shows and module when it cancels.
    }
    
    func tapSignIn() {
        //<-- go to login screen then with beacon
    }
    
    func tapSignUp() {
        //<-- go to registration screen with beacon
    }
}

////////////

class LoginScreenState: OmnitureState {
    var username: String { return "username" }
    var password: String { return "password" }
    
    override var expectedTray: Tray {
        //<-- verify login page name
        return Tray()
    }
    func enterUserCredentials() {
        //<-- enter username and password
    }
    func tapSignIn() {
        enterUserCredentials()
        //<-- tap button and fire module
    }
    func tapSignUp() {
        //<-- go to reg screen with beacon
    }
}

class RegScreenState: LoginScreenState {
    override var expectedTray: Tray {
        //<-- verify registration page name.  beacon may indicate it came from login screen or from login pop up
        return Tray()
    }
    override func enterUserCredentials() {
        super.enterUserCredentials()
        //<--tap birthdate picker
        //<--tap done
        //<--tap agree to terms
    }
    override func tapSignIn() {
        // technically there is no sign in on reg, so make it call signup instead
        tapSignUp()
    }
    override func tapSignUp() {
        //<-- tap button and fire module
    }
}

////////////




