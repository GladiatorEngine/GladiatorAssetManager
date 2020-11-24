//
//  AssetType.swift
//  
//
//  Created by Pavel Kasila on 11/24/20.
//

import Foundation

public enum AssetType: UInt8, Codable {
    case texture = 0x00 // Texture
    case model = 0x01 // Model
    case animation = 0x02 // Animation
    case intelligence = 0x03 // Intelligence description
    
    case pack = 0xAA // Combined pack of assets
}
