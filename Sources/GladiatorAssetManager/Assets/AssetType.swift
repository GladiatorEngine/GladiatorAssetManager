//
//  AssetType.swift
//  
//
//  Created by Pavel Kasila on 11/24/20.
//

import Foundation

public enum AssetType: UInt8, Codable {
    case texture = 0xAA // Texture
    case model = 0xBB // Model
    case animation = 0xCC // Animation
    case intelligence = 0xDD // Intelligence description
    
    case pack = 0xEE // Combined pack of assets
}
