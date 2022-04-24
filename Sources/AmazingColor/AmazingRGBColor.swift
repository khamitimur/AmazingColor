//
//  AmazingRGBColor.swift
//
//
//  Created by Тимур Хамидов on 03.01.2022.
//

import AmazingColorHelpers

/// RGB color model with an alpha.
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
    
    /// Initializes a new instance with the provided hex triplet color representation.
    /// - Parameters:
    ///   - hex: Hex triplet color representation.
    public init?(hex: String) {
        guard let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(hex: hex) else {
            return nil
        }
        
        self.red = red
        self.green = green
        self.blue = blue
        
        self.alpha = 255
    }
    
    // MARK: - IAmazingColor
    
    public let red: UInt8
    
    public let green: UInt8
    
    public let blue: UInt8
    
    public let alpha: UInt8
    
    // MARK: - Public Methods
    
    /// Returns a new instance with the provided red value.
    /// - Parameter red: Red value.
    public func with(red: UInt8) -> AmazingRGBColor {
        AmazingRGBColor(red, self.green, self.blue, self.alpha)
    }
    
    /// Returns a new instance with the provided green value.
    /// - Parameter red: Green value.
    public func with(green: UInt8) -> AmazingRGBColor {
        AmazingRGBColor(self.red, green, self.blue, self.alpha)
    }
    
    /// Returns a new instance with the provided blue value.
    /// - Parameter blue: Blue value.
    public func with(blue: UInt8) -> AmazingRGBColor {
        AmazingRGBColor(self.red, self.green, blue, self.alpha)
    }
    
    /// Returns a new instance with the provided alpha value.
    /// - Parameter hue: Alpha value.
    public func with(alpha: UInt8) -> AmazingRGBColor {
        AmazingRGBColor(self.red, self.green, self.blue, alpha)
    }
}
