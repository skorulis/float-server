//
//  MaxValueField.swift
//  Common
//
//  Created by Alexander Skorulis on 26/6/18.
//

public class MaxValueField: Codable {

    public var value:Int
    public var maxValue:Int
    
    public init(maxValue:Int) {
        self.maxValue = maxValue
        self.value = maxValue
    }
    
}
