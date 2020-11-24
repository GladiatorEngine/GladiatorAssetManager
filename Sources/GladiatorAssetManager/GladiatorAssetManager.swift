import Foundation
import Crypto

public struct GladiatorAssetManager {
    var textures: [Texture] = []
    
    public init() {
        
    }
    
    public mutating func loadTextureAsset(path: String) {
        let assetTuple = self.loadAsset(path: path)
        if assetTuple.0 != .texture {
            fatalError("\(path) is not a texture")
        }
        
        self.textures.append(Texture(sourceData: assetTuple.1))
    }
    
    private func loadAsset(path: String) -> (AssetType, Data) {
        do {
            let fullAsset = try Data(contentsOf: URL(fileURLWithPath: path))
            
            let assetTypeByte: UInt8 = fullAsset.subdata(in: 0..<2).withUnsafeBytes {$0.pointee}
            
            guard let assetType = AssetType(rawValue: assetTypeByte) else {throw AssetLoadErrors.failedToParseType(byte: assetTypeByte)}
            let data = fullAsset.subdata(in: 2..<fullAsset.endIndex-128)
            
            // Verify data with hash
            let hash = fullAsset.subdata(in: fullAsset.endIndex-128..<fullAsset.endIndex)
            if Data() + SHA512.hash(data: data) != hash {
                fatalError("Asset hash is not valid!")
            }
            
            return (assetType, data)
        } catch let e {
            fatalError("Cannot load asset: \(e)")
        }
    }
    
    public static func saveAsset(path: String, type: AssetType, data: Data) {
        do {
            let typeByteData = Data([type.rawValue])
            let hash = SHA512.hash(data: data)
            let fullData = typeByteData + data + hash
            try fullData.write(to: URL(fileURLWithPath: path))
        } catch let e {
            fatalError("Failed to save asset: \(e)")
        }
    }
}
