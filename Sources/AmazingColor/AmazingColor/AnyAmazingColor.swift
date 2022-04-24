//
//  AnyAmazingColor.swift
//  
//
//  Created by Тимур Хамидов on 24.04.2022.
//

/// Type-erased representation of a basic color model.
public struct AnyAmazingColor: IAmazingColor {
    
    // MARK: - Private Properties
    
    private let redClosure: () -> UInt8
    private let greenClosure: () -> UInt8
    private let blueClosure: () -> UInt8
    private let alphaClosure: () -> UInt8
    
    // MARK: - Initializers
    
    public init<Color: IAmazingColor>(_ color: Color) {
        redClosure = { color.red }
        greenClosure = { color.green }
        blueClosure = { color.blue }
        alphaClosure = { color.alpha }
    }
    
    // MARK: - IAmazingColor
    
    public var red: UInt8 {
        redClosure()
    }
    
    public var green: UInt8 {
        greenClosure()
    }
    
    public var blue: UInt8 {
        blueClosure()
    }
    
    public var alpha: UInt8 {
        alphaClosure()
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: AnyAmazingColor, rhs: AnyAmazingColor) -> Bool {
        lhs.red == rhs.red &&
        lhs.green == rhs.green &&
        lhs.blue == rhs.blue &&
        lhs.alpha == rhs.alpha
    }
}
