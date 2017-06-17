//
//  OmnitureRoute.swift
//  OmnitureVerification
//
//  Created by Derrick Ho on 6/17/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

import XCTest

class OmnitureRoute {
    let xctestcase: XCTestCase
    init(xctestcase: XCTestCase) { self.xctestcase = xctestcase }

    func signOut_resetEnvironment_deleteContentFromUser(){}
}

////////////

class HomeRoute: OmnitureRoute {
    func homeVerification(){
        //<-- verify home pagename
    }
}

////////////

class MyMedsRoute: OmnitureRoute {
    func tapMyMeds() {
        //<-- open settings menu
        //<-- verify setting pagename
        //<-- settings screen tap my meds button
        //<-- if offline verify module
        
        //<-- if online verify mymeds pagename and module
    }
    
    func tapCancel(pagename: String) {
        //<-- send cancel module and link
        //<-- verify `pagename` value
    }
    
    func tapSignIn() {
        //<-- send beacon to login page
    }
    
    func tapSignUp() {
        //<-- send beacon to reg page
    }
    
    func verifyMyMeds(module: String, mlink: String) {
        //<-- verify pagename with module and link
    }
    
    func returnHome() {
        // we should be in my meds screen
        //<-- open settings
        //<-- go home
    }
}

class HomeMyMedsRoute: MyMedsRoute {
    override func tapMyMeds() {
        //<-- Home screen tap my meds button
        //<-- if offline verify module

        //<-- if online verify mymeds pagename and module
    }
    override func returnHome() {
        // we should be in my meds screen
        //<-- generic back button goes home
    }
}

///////////

class SignInRoute: OmnitureRoute {
    var username: String { return "username" }
    var password: String { return "password" }
    func enterCredentials() {
        //<-- add user name
        //<-- add password
    }
    func signIn() {
        enterCredentials()
        //<-- tap signin button
        // wait
    }
}

class SignInViaRegRoute: SignInRoute {
   override var username: String { return "test\(Date().timeIntervalSince1970)" }
    override func enterCredentials() {
        super.enterCredentials()
        //<-- tap birthdate row
        //<-- tap done
    }
    override func signIn() {
        enterCredentials()
        //<-- tap signUp button
    }
}

class SignInViaRegViaLoginRoute: SignInViaRegRoute {
    override func signIn() {
        // we are in the login screen. 
        //<-- tap sign up button
        super.signIn()
    }
}

///////////


//////////

