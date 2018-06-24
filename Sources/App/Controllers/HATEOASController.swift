//
//  HATEOASController.swift
//  App
//
//  Created by Alexander Skorulis on 24/6/18.
//

import Vapor

class HATEOASController {

    private class func baseHost(_ req: Request) -> String {
        return "http://" + req.http.headers.firstValue(name: HTTPHeaderName.host)!
    }
    
    func index(_ req: Request) throws -> [String:String] {
        let host = HATEOASController.baseHost(req)
        let loreURL = host + "/lore"
        
        return ["lore":loreURL]
    }
    
    class func loreURL(lore:LoreModel, req:Request) -> String {
        return baseHost(req) + "/lore/" + lore.name.lowercased()
    }
    
}
