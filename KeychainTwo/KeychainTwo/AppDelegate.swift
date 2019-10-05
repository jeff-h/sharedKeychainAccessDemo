//
//  AppDelegate.swift
//  KeychainTwo
//
//  Created by Jeff Hanbury on 7/05/18.
//  Copyright © 2018 Marmaladesoul. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    // Retrieves the two entries from the Keychain.
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let keychain = Keychain(service: "serviceNameA", accessGroup: "38T4C62JZM.com.marmaladesoul.KeychainOne")
        
        print( keychain["testItem"] )

        // With PR from https://github.com/kishikawakatsumi/KeychainAccess/pull/363
        let sshKeychain = Keychain(server: "ssh://server.com", protocolType: .ssh, accessGroup: "38T4C62JZM.com.marmaladesoul.KeychainOne")

        print( sshKeychain["testItem"] )

        // Run the Command Line Tool
        let path = Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("CommandLineTool").path

        let task = Process()
        let pipe = Pipe()
        task.standardOutput = pipe

        task.launchPath = path
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: String.Encoding.utf8)
        print(output!)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

