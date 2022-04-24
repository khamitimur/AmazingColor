//
//  AmazingRGBColor.swift
//
//
//  Created by Тимур Хамидов on 03.01.2022.
//

/// Representation of a RGB color model with an alpha.
public struct AmazingRGBColor: IAmazingColor {
    
    // MARK: - Initializers
    
    /// Initializes a new instance with the provided color values.
    /// - Parameters:
    ///   - red: Red value.
    ///   - green: Green value.
    ///   - blue: Blue value.
    ///   - alpha: Alpha value.
    public init(_ red: UInt8, _ green: UInt8, _ blue: UInt8, _ alpha: UInt8 = 255) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    // MARK: - IAmazingColor
    
    public let red: UInt8
    
    public let green: UInt8
    
    public let blue: UInt8
    
    public let alpha: UInt8
    
    // MARK: - Public Methods
    
    public func with(red: UInt8) -> AmazingRGBColor {
        AmazingRGBColor(red, self.green, self.blue, self.alpha)
    }
    
    public func with(green: UInt8) -> AmazingRGBColor {
        AmazingRGBColor(self.red, green, self.blue, self.alpha)
    }
    
    public func with(blue: UInt8) -> AmazingRGBColor {
        AmazingRGBColor(self.red, self.green, blue, self.alpha)
    }
    
    public func with(alpha: UInt8) -> AmazingRGBColor {
        AmazingRGBColor(self.red, self.green, self.blue, alpha)
    }
}
