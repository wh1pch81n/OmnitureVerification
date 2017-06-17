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

class OmnitureState {
    let xctestcase: XCTestCase
    let beacon: (mmodule: String, mlink: String)
    init(xctestcase: XCTestCase
        , mmodule: String = ""
        , mlink: String = "")
    {
        self.xctestcase = xctestcase
        self.beacon = (mmodule, mlink)
        
        stateVerification() // verify state
    }
    
    /**
     This method is called upon state creation.  do not call this directly
     */
    func stateVerification() {
        //<-- verify that the current state is right aka pagename
    }
    func signOut_resetEnvironment_deleteContentFromUser(){}
}

////////////

class HomeState: OmnitureState, OpenSettingsProtocol {
 
    override func stateVerification() {
        //<-- verify home-screen
    }
    
    func tapMyMeds() {
        //<-- tap My meds
        //<-- if online send beacon to next page
        
        //<-- if offline go popUp Route
    }
}

class SettingsState: OmnitureState {
    override func stateVerification() {
        //<-- verify settings screen
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
    override func stateVerification() {
        //<-- verify MyMeds page name with beacon attributes
    }
    func goBackToHome() {
        //<-- if left bar button item is OpenSettings then go home via settings manipulation
        
        //<-- otherwise tap the back button on navigation bar to get home
    }
}

/////////////

class LoginPopUpState: OmnitureState {
    override func stateVerification() {
        //<-- verify module
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
    override func stateVerification() {
        //<-- verify login page name
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
    override func stateVerification() {
        //<-- verify registration page name.  beacon may indicate it came from login screen or from login pop up
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




