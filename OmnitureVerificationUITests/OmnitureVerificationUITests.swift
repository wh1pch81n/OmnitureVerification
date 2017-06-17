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
        
        OmnitureState.init(xctestcase: self).signOut_resetEnvironment_deleteContentFromUser()
    }
    
    override func tearDown() {
        _ = HomeState.init(xctestcase: self) //<-- end at home
        OmnitureState.init(xctestcase: self).signOut_resetEnvironment_deleteContentFromUser()
        super.tearDown()
    }
    
    func test_goToMyMeds_via_HomeMyMeds_usingLogin() {
        let hs = HomeState(xctestcase: self)
        hs.tapMyMeds()
        let lp = LoginPopUpState(xctestcase: self)
        lp.tapCancel()
        hs.tapMyMeds()
        lp.tapSignIn()
        
        LoginScreenState(xctestcase: self, mmodule: "mymeds", mlink: "sgnin")
            .tapSignIn()
        MyMedsState(xctestcase: self, mmodule: "login-success", mlink: "")
            .goBackToHome()
        
        hs.tapMyMeds()
        MyMedsState(xctestcase: self, mmodule: "mymeds", mlink: "")
            .goBackToHome()
    }

    func test_goToMyMeds_via_SettingsMyMeds_usingLogin() {
        HomeState(xctestcase: self) //<- begin at home
            .openSettings()
        let ss = SettingsState(xctestcase: self)
        ss.tapMyMeds()
        
        LoginPopUpState(xctestcase: self)
            .tapCancel()
        ss.tapMyMeds()
        LoginPopUpState(xctestcase: self)
            .tapSignIn()
        
        LoginScreenState(xctestcase: self, mmodule: "mymeds", mlink: "sgnin")
            .tapSignIn()
        MyMedsState(xctestcase: self, mmodule: "login-success", mlink: "")
            .goBackToHome()
        HomeState(xctestcase: self)
            .openSettings()
        SettingsState(xctestcase: self)
            .tapMyMeds()
        MyMedsState(xctestcase: self, mmodule: "mymeds", mlink: "")
            .goBackToHome()
    }
    
}
