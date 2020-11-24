//
//  Asset.swift
//  
//
//  Created by Pavel Kasila on 11/24/20.
//

import Foundation

public protocol Asset: Codable {
    init(sourceData: Data)
    func assetData() -> Data
    func assetType() -> AssetType
}
