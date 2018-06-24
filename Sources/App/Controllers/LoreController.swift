//
//  WikiController.swift
//  App
//
//  Created by Alexander Skorulis on 23/6/18.
//

import Vapor

class LoreController {

    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder();
    private var loreMapping:[String:LoreModel]
    
    init() {
        var loreDict = [String:LoreModel]()
        do {
            let fileURL = LoreController.dataURL()
            
            let data = try Data(contentsOf: fileURL)
            let loreArray = try decoder.decode(LoreArray.self, from: data)
            
            loreArray.lore.forEach { (lore) in
                loreDict[lore.name.lowercased()] = lore
            }
        } catch {
            print("Error: \(error)" )
        }
        loreMapping = loreDict
    }
    
    private class func dataURL() -> URL {
        let home = FileManager.default.homeDirectoryForCurrentUser
        return URL(fileURLWithPath: "dev/floats/float-server/Data/lore.json", relativeTo: home)
    }
    
    func index(_ req: Request) throws -> [String:String] {
        var dict = [String:String]()
        loreMapping.forEach { (key,value) in
            dict[key] = HATEOASController.loreURL(lore: value, req: req)
        }
        return dict;
    }
    
    func getLore(_ req: Request) throws -> LoreModel {
        let loreName = try req.parameters.next(String.self)
        let loreItem = loreMapping[loreName.lowercased()]
        guard let item = loreItem else {
            throw Abort.init(.badRequest)
        }
        return item
    }
    
    func updateLore(_ req: Request) throws -> LoreModel {
        let x:LoreModel = try req.content.syncDecode(LoreModel.self)
        loreMapping[x.name] = x;
        let fileURL = LoreController.dataURL()
        let array = LoreArray(lore: Array(self.loreMapping.values))
        let data = try encoder.encode(array)
        try data.write(to: fileURL)
        
        return x;
    }
    
}
