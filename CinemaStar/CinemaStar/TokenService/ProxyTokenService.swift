// ProxyTokenService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Cервис для получения токена из директории
final class ProxyTokenService {
    // MARK: - Private Properties

    private var fileManager = FileManager.default
    private var token = String()

    // MARK: - Public Methods

    func getToken() -> String? {
        let manager = FileManager.default
        guard let url = manager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else {
            return ""
        }

        let fileUrl = url.appendingPathComponent(AppConstants.fileName)
        print(fileUrl)
        do {
            token = try String(contentsOf: fileUrl, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
        return token
    }
}
