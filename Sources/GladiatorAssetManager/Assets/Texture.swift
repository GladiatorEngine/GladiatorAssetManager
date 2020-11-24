//
//  Texture.swift
//  
//
//  Created by Pavel Kasila on 11/24/20.
//

import Foundation

public struct Texture: Asset {
    let data: Data
    
    public init(sourceData: Data) {
        self.data = sourceData
    }
    
    public func assetData() -> Data {
        return self.data
    }
    
    public func assetType() -> AssetType {
        return .texture
    }
}
