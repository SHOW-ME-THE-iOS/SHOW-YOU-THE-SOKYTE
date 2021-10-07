//
//  ViewController.swift
//  KeyChain-Demo
//
//  Created by soyeon on 2021/10/08.
//

import UIKit

struct Credentials {
    var userName: String
    var password: String
}

enum KeychainError: Error {
    case unexpectedPasswordStatus
    case duplicatePasswordKeyValue
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        try? addItemsOnKeyChain()
        readItemsOnKeyChain()
//        deleteItemOnKeyChain(key: "soyeon")
    }
    
    //MARK: 키체인에 넣을 아이템 생성
    private func addItemsOnKeyChain() throws {
        //간단하게 네임이 younsu이고, 패스워드가 ask123인 유저의 패스워드를 keychain 형식으로 저장.
        let credentials = Credentials(userName: "soyeon", password: "ask12345")
        let account = credentials.userName
        let password = credentials.password.data(using: String.Encoding.utf8)!
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                    kSecAttrAccount: account,
                                    kSecValueData: password]
        let status = SecItemAdd(query as CFDictionary, nil)
        if status == errSecSuccess {
            print("success")
        } else if status == errSecDuplicateItem {
            updateItemOnKeyChain(value: password, key: account)
        } else {
            print("add failed")
            throw KeychainError.unexpectedPasswordStatus
        }
    }
    
    //MARK: 해당 계정으로 패스워드를 키체인에서 가져오기
    private func readItemsOnKeyChain() {
        let account = "soyeon"
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                    kSecAttrAccount: account,
                                    kSecReturnAttributes: true,
                                    kSecReturnData: true]
        var item: CFTypeRef?
        if SecItemCopyMatching(query as CFDictionary, &item) != errSecSuccess {
            print("read failed")
            return
        }
        guard let existingItem = item as? [String: Any] else { return }
        guard let data = existingItem["v_Data"] as? Data else { return }
        guard let password = String(data: data, encoding: .utf8) else { return }
        
        print(password)
    }
    
    //MARK: 같은 키값이면 업데이트하기
    private func updateItemOnKeyChain(value: Any, key: Any) {
        let previousQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                              kSecAttrAccount: key]
        let updateQuery: [CFString: Any] = [kSecValueData: value]
        let status = SecItemUpdate(previousQuery as CFDictionary, updateQuery as CFDictionary)
        if status == errSecSuccess {
            print("update complete")
        } else {
            print("not finished update")
        }
    }
    
    //MARK: 해당 string으로 이루어진 키데이터 쌍 삭제하기
    private func deleteItemOnKeyChain(key: String) {
        let deleteQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                            kSecAttrAccount: key]
        let status = SecItemDelete(deleteQuery as CFDictionary)
        if status == errSecSuccess {
            print("remove key-data complete")
        } else {
            print("remove key-data failed")
        }
    }

}


