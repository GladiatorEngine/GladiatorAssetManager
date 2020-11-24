import Foundation

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
            guard let url = URL(string: path) else {throw AssetLoadErrors.failedToParseURL(path: path)}
            
            let fullAsset = try Data(contentsOf: url)
            
            let assetTypeByte: UInt8 = fullAsset.subdata(in: 0..<2).withUnsafeBytes {$0.pointee}
            
            guard let assetType = AssetType(rawValue: assetTypeByte) else {throw AssetLoadErrors.failedToParseType(byte: assetTypeByte)}
            
            return (assetType, fullAsset.subdata(in: 2..<fullAsset.endIndex))
        } catch let e {
            fatalError("Cannot load asset: \(e)")
        }
    }
    
    public static func saveAsset(path: String, type: AssetType, data: Data) {
        do {
            let typeByteData = Data([type.rawValue])
            let fullData = typeByteData + data
            
            guard let url = URL(string: path) else {throw AssetLoadErrors.failedToParseURL(path: path)}
            try fullData.write(to: url)
        } catch let e {
            fatalError("Failed to save asset: \(e)")
        }
    }
}
