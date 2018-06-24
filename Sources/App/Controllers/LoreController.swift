//
//  WikiController.swift
//  App
//
//  Created by Alexander Skorulis on 23/6/18.
//

import Vapor

class LoreController {

    private let decoder = JSONDecoder()
    private let loreMapping:[String:LoreModel]
    
    init() {
        var loreDict = [String:LoreModel]()
        do {
            let home = FileManager.default.homeDirectoryForCurrentUser
            let fileURL = URL(fileURLWithPath: "dev/floats/float-server/Data/lore.json", relativeTo: home)
            
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
    
}
