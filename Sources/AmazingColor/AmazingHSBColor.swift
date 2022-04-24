//
//  AmazingHSBColor.swift
//  
//
//  Created by Timur Khamidov on 04.01.2022.
//

import AmazingColorHelpers

/// Representation of a HSB color model with an alpha.
public struct AmazingHSBColor: IAmazingColor {
    
    // MARK: - Public Properties
    
    /// Gets hue value in degrees.
    public let hue: Float
    
    /// Gets saturation value in percents.
    public let saturation: Float
    
    /// Gets brightness value in percents.
    public let brightness: Float
    
    // MARK: - Initializers
    
    /// Initializes a new instance with the provided values.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - brightness: Brightness value in percents.
    ///   - alpha: Alpha value.
    public init(_ hue: Float, _ saturation: Float, _ brightness: Float, _ alpha: UInt8 = 255) {
        let (hue, saturation, brightness) = AmazingColorModelHelpers.shared.normalized(hue: hue, saturation: saturation, brightness: brightness)
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(hue: hue, saturation: saturation, brightness: brightness)
        
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
        
        self.red = red
        self.green = green
        self.blue = blue
        
        self.alpha = alpha
    }
    
    private init(_ color: AmazingHSBColor, _ alpha: UInt8) {
        self.hue = color.hue
        self.saturation = color.saturation
        self.brightness = color.brightness
        
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
    
    /// Returns a new instance of the ``AmazingHSBColor`` with the provided hue component value.
    public func with(hue: Float) -> AmazingHSBColor {
        AmazingHSBColor(hue, self.saturation, self.brightness, self.alpha)
    }
    
    /// Returns a new instance of the ``AmazingHSBColor`` with the provided saturation component value.
    public func with(saturation: Float) -> AmazingHSBColor {
        AmazingHSBColor(self.hue, saturation, self.brightness, self.alpha)
    }
    
    /// Returns a new instance of the ``AmazingHSBColor`` with the provided brightness component value.
    public func with(brightness: Float) -> AmazingHSBColor {
        AmazingHSBColor(self.hue, self.saturation, brightness, self.alpha)
    }
    
    /// Returns a new instance of the ``AmazingHSBColor`` with the provided alpha component value.
    public func with(alpha: UInt8) -> AmazingHSBColor {
        AmazingHSBColor(self, alpha)
    }
}
