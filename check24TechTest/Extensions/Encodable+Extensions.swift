//
//  Encodable+Extensions.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//

import Foundation

extension Encodable {
    
    func asDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            return dictionary ?? [:]
        } catch {
            return [:]
        }
    }
    
}
