//
//  IAmazingColor.swift
//  
//
//  Created by Тимур Хамидов on 04.01.2022.
//

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
}
