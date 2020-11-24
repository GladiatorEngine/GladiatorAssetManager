//
//  Model.swift
//  
//
//  Created by Pavel Kasila on 11/24/20.
//

import Foundation

public struct Model: Asset {
    public init(sourceData: Data) {
        let amountOfVertices: Int = sourceData.subdata(in: 0..<MemoryLayout<Int>.size).withUnsafeBytes {$0.pointee}
        var vertices = [Float]()
        for i in 0..<amountOfVertices {
            let pos = MemoryLayout<Int>.size + MemoryLayout<Float>.size * i
            vertices.append(sourceData.subdata(in: pos..<pos+MemoryLayout<Float>.size).withUnsafeBytes {$0.pointee})
        }
        self.vertices = vertices
    }
    
    public func assetData() -> Data {
        var data = Data()
        
        for vertex in self.vertices {
            data = data + withUnsafeBytes(of: vertex) { Data($0) }
        }
        
        return data
    }
    
    public func assetType() -> AssetType {
        return .model
    }
    
    public private(set) var vertices: [Float]
}

