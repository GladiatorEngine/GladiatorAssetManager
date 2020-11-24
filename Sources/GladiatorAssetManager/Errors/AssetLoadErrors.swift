//
//  AssetLoadErrors.swift
//  
//
//  Created by Pavel Kasila on 11/24/20.
//

import Foundation

public enum AssetLoadErrors: Error {
    case failedToParseType(byte: UInt8)
}
