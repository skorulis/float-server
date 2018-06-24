//
//  LoreModel.swift
//  App
//
//  Created by Alexander Skorulis on 23/6/18.
//

import Vapor

struct LoreModel: Content {

    let name: String
    let body: String
    
}

struct LoreArray: Codable {
    
    let lore:[LoreModel]
    
}
