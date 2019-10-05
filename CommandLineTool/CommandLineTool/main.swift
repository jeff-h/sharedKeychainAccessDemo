//
//  main.swift
//  CommandLineTool
//
//  Created by Jeff Hanbury on 5/10/19.
//  Copyright © 2019 Marmaladesoul. All rights reserved.
//

import Foundation

let keychain = Keychain(service: "serviceNameA", accessGroup: "38T4C62JZM.com.marmaladesoul.KeychainOne")

print( "Command Line Tool: ", keychain["testItem"] )

// With PR from https://github.com/kishikawakatsumi/KeychainAccess/pull/363
let sshKeychain = Keychain(server: "ssh://server.com", protocolType: .ssh, accessGroup: "38T4C62JZM.com.marmaladesoul.KeychainOne")

print( "Command Line Tool: ", sshKeychain["testItem"] )
