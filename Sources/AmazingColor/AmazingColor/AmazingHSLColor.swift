//
//  AmazingHSLColor.swift
//  
//
//  Created by Тимур Хамидов on 24.04.2022.
//

import AmazingColorHelpers

/// HSL color model with an alpha.
public struct AmazingHSLColor: IAmazingColor {
    
    // MARK: - Public Properties
    
    /// Gets hue value in degrees.
    public let hue: Float
    
    /// Gets saturation value in percents.
    public let saturation: Float
    
    /// Gets lightness value in percents.
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
    
    /// Returns a new instance with it's hue value rotated by the provided number of degrees.
    ///
    /// ```
    /// let c = AmazingHSLColor(180.0, 50.0, 50.0)
    ///
    /// let c1 = c.rotated(degrees: 20.0)
    /// // c1.hue == 200.0
    ///
    /// let c2 = c.rotated(degrees: -200.0)
    /// // c2.hue == -20.0
    ///
    /// let c3 = c.rotated(degrees: 300.0)
    /// // c3.hue == 120.0
    /// ```
    ///
    /// - Parameters:
    ///   - degrees: Number of degrees to rotate hue value.
    public func rotated(degrees: Float) -> AmazingHSLColor {
        let hue = AmazingHueHelpers.shared.rotated(hue: self.hue, degrees: degrees)
        
        return self.with(hue: hue)
    }
    
    /// Returns a new instance of a complementary color.
    ///
    /// Complementary color is calculated by rotating hue value by `180` degrees.
    ///
    /// ```
    /// let c = AmazingHSLColor(240.0, 50.0, 50.0)
    ///
    /// let c1 = c.complementary()
    /// // c1.hue == 60.0
    /// ```
    ///
    /// [What Are Complementary Colors?](https://www.color-meanings.com/complementary-colors)
    public func complementary() -> AmazingHSLColor {
        let hue = AmazingHueHelpers.shared.complementary(hue: self.hue)
        
        return self.with(hue: hue)
    }
    
    /// Returns new instances of split-complementary colors.
    ///
    /// Split-Complementary colors are calculated by rotating hue value by `-150` and `150` degrees.
    ///
    /// ```
    /// let c = AmazingHSLColor(50.0, 50.0, 50.0)
    ///
    /// let (c1, c2) = c.splitComplementary()
    /// // c1.hue == 260.0
    /// // c2.hue == 200.0
    /// ```
    ///
    /// [What Are Split-Complementary Colors?](https://www.color-meanings.com/split-complementary-colors)
    public func splitComplementary() -> (AmazingHSLColor, AmazingHSLColor) {
        let hues = AmazingHueHelpers.shared.splitComplementary(hue: self.hue)
        
        return (
            self.with(hue: hues.0),
            self.with(hue: hues.1)
        )
    }
    
    /// Returns new instances of triadic colors.
    ///
    /// Triadic colors are calculated by rotating hue value by `-120` and `120` degrees.
    ///
    /// ```
    /// let c = AmazingHSLColor(50.0, 50.0, 50.0)
    ///
    /// let (c1, c2) = c.triadic()
    /// // c1.hue == 290.0
    /// // c2.hue == 170.0
    /// ```
    ///
    /// [What Are Triadic Colors?](https://www.color-meanings.com/triadic-colors)
    public func triadic() -> (AmazingHSLColor, AmazingHSLColor) {
        let hues = AmazingHueHelpers.shared.triadic(hue: self.hue)
        
        return (
            self.with(hue: hues.0),
            self.with(hue: hues.1)
        )
    }
    
    /// Returns new instances of square colors.
    ///
    /// Square colors are calculated by rotating hue value by `90`, `180` and `270` degrees.
    ///
    /// ```
    /// let c = AmazingHSLColor(110.0, 50.0, 50.0)
    ///
    /// let (c1, c2, c3) = c.square()
    /// // c1.hue == 200.0
    /// // c2.hue == 290.0
    /// // c3.hue == 20.0
    /// ```
    ///
    /// [What Are Square Colors?](https://www.color-meanings.com/square-color-schemes)
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    public func square() -> (AmazingHSLColor, AmazingHSLColor, AmazingHSLColor) {
        let hues = AmazingHueHelpers.shared.square(hue: self.hue)
        
        return (
            self.with(hue: hues.0),
            self.with(hue: hues.1),
            self.with(hue: hues.2)
        )
    }
    
    /// Returns new instances of rectangle colors.
    ///
    /// Rectangle colors are calculated by rotating hue value by `120`, `180` and `300` degrees.
    ///
    /// ```
    /// let c = AmazingHSLColor(90.0, 50.0, 50.0)
    ///
    /// let (c1, c2, c3) = c.rectangle()
    /// // c1.hue == 210.0
    /// // c2.hue == 270.0
    /// // c3.hue == 30.0
    /// ```
    ///
    /// [What Are Rectangle Colors?](https://www.color-meanings.com/rectangular-tetradic-color-schemes)
    public func rectangle() -> (AmazingHSLColor, AmazingHSLColor, AmazingHSLColor) {
        let hues = AmazingHueHelpers.shared.rectangle(hue: self.hue)
        
        return (
            self.with(hue: hues.0),
            self.with(hue: hues.1),
            self.with(hue: hues.2)
        )
    }
    
    /// Returns new instances of analogus colors.
    ///
    /// Analogous colors are calculated by rotating hue value by `-30` and `30` degrees.
    ///
    /// ```
    /// let c = AmazingHSLColor(10.0, 50.0, 50.0)
    ///
    /// let (c1, c2) = c.analogus()
    /// // c1.hue == 340.0
    /// // c2.hue == 40.0
    /// ```
    ///
    /// [What Are Analogous Colors?](https://www.color-meanings.com/analogous-colors)
    public func analogus() -> (AmazingHSLColor, AmazingHSLColor) {
        let hues = AmazingHueHelpers.shared.analogus(hue: self.hue)
        
        return (
            self.with(hue: hues.0),
            self.with(hue: hues.1)
        )
    }
}
