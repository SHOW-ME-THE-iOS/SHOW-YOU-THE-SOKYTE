//
//  StorageManager.swift
//  KeyChain-Demo
//
//  Created by soyeon on 2021/10/10.
//

import Foundation
import Security

final class StorageManager {

  // MARK: Shared instance

  static let shared = StorageManager()
  private init() { }

  // MARK: Keychain
  
  private let account = "Service"
  private let service = Bundle.main.bundleIdentifier

  private lazy var query: [CFString: Any]? = {
    guard let service = self.service else { return nil }
    return [kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account]
  }()

  func createUser(_ user: User) -> Bool {
    guard let data = try? JSONEncoder().encode(user),
      let service = self.service else { return false }

    let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                  kSecAttrService: service,
                                  kSecAttrAccount: account,
                                  kSecAttrGeneric: data]

    return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
  }

  func readUser() -> User? {
    guard let service = self.service else { return nil }
    let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                  kSecAttrService: service,
                                  kSecAttrAccount: account,
                                  kSecMatchLimit: kSecMatchLimitOne,
                                  kSecReturnAttributes: true,
                                  kSecReturnData: true]

    var item: CFTypeRef?
    if SecItemCopyMatching(query as CFDictionary, &item) != errSecSuccess { return nil }

    guard let existingItem = item as? [String: Any],
        let data = existingItem[kSecAttrGeneric as String] as? Data,
        let user = try? JSONDecoder().decode(User.self, from: data) else { return nil }

    return user
  }

  func updateUser(_ user: User) -> Bool {
    guard let query = self.query,
      let data = try? JSONEncoder().encode(user) else { return false }
    
    let attributes: [CFString: Any] = [kSecAttrAccount: account,
                                     kSecAttrGeneric: data]

    return SecItemUpdate(query as CFDictionary, attributes as CFDictionary) == errSecSuccess
  }

  func deleteUser() -> Bool {
    guard let query = self.query else { return false }
    return SecItemDelete(query as CFDictionary) == errSecSuccess
  }
}
