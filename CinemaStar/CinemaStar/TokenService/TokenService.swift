// TokenService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import KeychainAccess

/// Сервис для сохранения токена
final class TokenService {
    static let shared = TokenService()
    private let keychain = Keychain()
    private let manager = ProxyTokenService()
    var token = String()

    func saveToken() {
        guard let tokenSaved = manager.getToken() else { return }
        do {
            try? keychain.set(tokenSaved, key: AppConstants.forKeyName)
        }
        print(keychain.allKeys)
    }

    func returnToken() -> String? {
        do {
            guard let token = try keychain.get(AppConstants.forKeyName) else { return nil }
            self.token = token

            print(token)
        } catch {
            print(error.localizedDescription)
        }
        return token
    }
}
