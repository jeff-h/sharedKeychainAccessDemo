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



    // Stores two entries into the Keychain.
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let keychain = Keychain(service: "serviceNameA", accessGroup: "38T4C62JZM.com.marmaladesoul.KeychainOne").synchronizable(true)

        keychain["testItem"] = "password-one"

        // With PR from https://github.com/kishikawakatsumi/KeychainAccess/pull/363
        let sshKeychain = Keychain(server: "ssh://server.com", protocolType: .ssh, accessGroup: "38T4C62JZM.com.marmaladesoul.KeychainOne").synchronizable(true)

        sshKeychain["testItem"] = "password-two"
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

