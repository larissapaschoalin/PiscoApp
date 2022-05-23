//
//  PersistenceService.swift
//  Abuble
//
//  Created by Marco Zulian on 20/05/22.
//

import Foundation

final class PersistenceService: ObservableObject {

    static let shared = PersistenceService()
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    init() {}
    
    func save<T: Codable>(_ element: T, key: String) {
        if let encoded = try? encoder.encode(element) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func retrieve<T: Codable>(_ type: T.Type, fromKey key: String) -> T? {
        if let savedData = UserDefaults.standard.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let loaded = try? decoder.decode(T.self, from: savedData) {
                return loaded
            }
        }
        return nil
    }
}
