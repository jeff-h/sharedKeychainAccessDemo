//
//  AppDelegate.swift
//  KeychainOne
//
//  Created by Jeff Hanbury on 7/05/18.
//  Copyright © 2018 Marmaladesoul. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let keychain = Keychain(service: "serviceNameF", accessGroup: "38T4C62JZM.com.marmaladesoul.testGroup")
        
        let token = keychain["testItem"]
        
        if token == nil {
            keychain["testItem"] = "abc123-E"
        }

        let msg = token ?? "nil"
        let alert = NSAlert()
        alert.messageText = "Token: " + msg
        alert.runModal()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

