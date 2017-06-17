//
//  OmnitureVerificationUITests.swift
//  OmnitureVerificationUITests
//
//  Created by Derrick Ho on 6/17/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

import XCTest

class OmnitureVerificationUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        OmnitureRoute.init(xctestcase: self).signOut_resetEnvironment_deleteContentFromUser()
        HomeRoute.init(xctestcase: self).homeVerification()
    }
    
    override func tearDown() {
        OmnitureRoute.init(xctestcase: self).signOut_resetEnvironment_deleteContentFromUser()
        super.tearDown()
    }
    
    func test_goToMyMeds_via_HomeMyMeds_usingLogin() {
        let mr = HomeMyMedsRoute.init(xctestcase: self)
        mr.tapMyMeds()
        mr.tapCancel(pagename: "home-screen")
        mr.tapMyMeds()
        mr.tapSignIn()
        
        let sir = SignInRoute.init(xctestcase: self)
        sir.signIn()
        mr.verifyMyMeds(module: "login-success", mlink: "")
        
        mr.returnHome()
        mr.tapMyMeds()
        mr.verifyMyMeds(module: "mymeds", mlink: "")
    }
    
    func test_goToMyMeds_via_SettingsMyMeds_usingLogin() {
        let mr = MyMedsRoute.init(xctestcase: self)
        mr.tapMyMeds()
        mr.tapCancel(pagename: "settings")
        mr.tapMyMeds()
        mr.tapSignIn()
        
        let sir = SignInRoute.init(xctestcase: self)
        sir.signIn()
        mr.verifyMyMeds(module: "login-success", mlink: "")
        
        mr.returnHome()
        
        mr.tapMyMeds()
    }
    
}
