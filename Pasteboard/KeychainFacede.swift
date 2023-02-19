//
//  KeychainFacede.swift
//  Pasteboard
//
//  Created by 山本響 on 2023/02/19.
//  Copyright © 2023 Nyisztor, Karoly. All rights reserved.
//

import Foundation
import Security

public enum KeychainFacadeError: Error {
    case invalidContent
    case failure(status: OSStatus)
}

class KeychainFacade {
    
    private func setupQueryDictionary(forKey key: String) -> [String: Any] {
        var queryDictionary: [String: Any] = [kSecClass as String: kSecClassGenericPassword]
        
        queryDictionary[kSecAttrAccount as String] = key.data(using: .utf8)
        
        return queryDictionary
    }
    
    public func set(string: String, forKey key: String) throws {
        guard !string.isEmpty && !key.isEmpty else {
            print("Can't add an empty string to the keychain")
            throw KeychainFacadeError.invalidContent
        }
        do {
            try removeString(forKey: key)
        } catch {
            throw error
        }
        var queryDictionary = setupQueryDictionary(forKey: key)
        queryDictionary[kSecValueData as String] = string.data(using: .utf8)
        
        let status = SecItemAdd(queryDictionary as CFDictionary, nil)
        if status != errSecSuccess {
            throw KeychainFacadeError.failure(status: status)
        }
    }
    
    public func removeString(forKey key: String) throws {
        guard !key.isEmpty else {
            print("Key must be valid")
            throw KeychainFacadeError.invalidContent
        }
        
        let queryDictionary = setupQueryDictionary(forKey: key)
        let status = SecItemDelete(queryDictionary as CFDictionary)
        if status != errSecSuccess {
            throw KeychainFacadeError.failure(status: status)
        }
    }
}
