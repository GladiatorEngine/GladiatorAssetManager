//
//  AssetLoadErrors.swift
//  
//
//  Created by Pavel Kasila on 11/24/20.
//

import Foundation

public enum AssetLoadErrors: Error {
    case failedToParseURL(path: String)
    case failedToParseType(byte: UInt8)
}
