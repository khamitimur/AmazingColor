//
//  AmazingHSLColor.swift
//  
//
//  Created by Тимур Хамидов on 24.04.2022.
//

import AmazingColorHelpers

/// Representation of a HSL color model with an alpha.
public struct AmazingHSLColor: IAmazingColor {
    
    // MARK: - Public Properties
    
    /// Return hue value in degrees.
    public let hue: Float
    
    /// Returns saturation value in percents.
    public let saturation: Float
    
    /// Returns lightness value in percents.
    public let lightness: Float
    
    // MARK: - Initializers
    
    /// Initializes a new instance with the provided values.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - lightness: Lightness value in percents.
    ///   - alpha: Alpha value.
    public init(_ hue: Float, _ saturation: Float, _ lightness: Float, _ alpha: UInt8 = 255) {
        let (hue, saturation, lightness) = AmazingColorModelHelpers.shared.normalized(hue: hue, saturation: saturation, lightness: lightness)
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(hue: hue, saturation: saturation, lightness: lightness)
        
        self.hue = hue
        self.saturation = saturation
        self.lightness = lightness
        
        self.red = red
        self.green = green
        self.blue = blue
        
        self.alpha = alpha
    }
    
    private init(_ color: AmazingHSLColor, _ alpha: UInt8) {
        self.hue = color.hue
        self.saturation = color.saturation
        self.lightness = color.lightness
        
        self.red = color.red
        self.green = color.green
        self.blue = color.blue
        
        self.alpha = color.alpha
    }
    
    // MARK: - IAmazingColor
    
    public let red: UInt8
    
    public let green: UInt8
    
    public let blue: UInt8
    
    public let alpha: UInt8
    
    // MARK: - Public Methods
    
    /// Returns a new instance with the provided hue value.
    /// - Parameter hue: Hue value in degrees.
    public func with(hue: Float) -> AmazingHSLColor {
        AmazingHSLColor(hue, self.saturation, self.lightness, self.alpha)
    }
    
    /// Returns a new instance with the provided saturation value.
    /// - Parameter saturation: Saturation value in percents.
    public func with(saturation: Float) -> AmazingHSLColor {
        AmazingHSLColor(self.hue, saturation, self.lightness, self.alpha)
    }
    
    /// Returns a new instance with the provided lightness value.
    /// - Parameter lightness: Lightness value in degrees.
    public func with(lightness: Float) -> AmazingHSLColor {
        AmazingHSLColor(self.hue, self.saturation, lightness, self.alpha)
    }
    
    /// Returns a new instance with the provided alpha value.
    /// - Parameter hue: Alpha value.
    public func with(alpha: UInt8) -> AmazingHSLColor {
        AmazingHSLColor(self, alpha)
    }
}
