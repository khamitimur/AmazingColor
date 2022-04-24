//
//  IAmazingColor.swift
//  
//
//  Created by Тимур Хамидов on 04.01.2022.
//

import AmazingColorHelpers

/// Basic color model.
public protocol IAmazingColor: Equatable {
    
    // MARK: - Properties
    
    /// Gets red value.
    var red: UInt8 { get }
    
    /// Gets green value.
    var green: UInt8 { get }
    
    /// Gets blue value.
    var blue: UInt8 { get }
    
    /// Gets alpha value.
    var alpha: UInt8 { get }
    
    // MARK: - Methods
    
    /// Returns hex triplet color representation.
    func hex() -> String
}

public extension IAmazingColor {
    
    // MARK: - Default Implementations
    
    func hex() -> String {
        AmazingColorModelHelpers.shared.hex(red: self.red, green: self.green, blue: self.blue)
    }
}
