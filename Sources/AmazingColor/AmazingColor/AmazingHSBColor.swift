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
    
    /// Returns a new instance with the provided hue value.
    /// - Parameter hue: Hue value in degrees.
    public func with(hue: Float) -> AmazingHSBColor {
        AmazingHSBColor(hue, self.saturation, self.brightness, self.alpha)
    }
    
    /// Returns a new instance with the provided saturation value.
    /// - Parameter saturation: Saturation value in percents.
    public func with(saturation: Float) -> AmazingHSBColor {
        AmazingHSBColor(self.hue, saturation, self.brightness, self.alpha)
    }
    
    /// Returns a new instance with the provided brightness value.
    /// - Parameter brightness: Brightness value in degrees.
    public func with(brightness: Float) -> AmazingHSBColor {
        AmazingHSBColor(self.hue, self.saturation, brightness, self.alpha)
    }
    
    /// Returns a new instance with the provided alpha value.
    /// - Parameter hue: Alpha value.
    public func with(alpha: UInt8) -> AmazingHSBColor {
        AmazingHSBColor(self, alpha)
    }
    
    /// Returns a new instance with it's hue value rotated by the provided number of degrees.
    ///
    /// ```
    /// let c = AmazingHSBColor(180.0, 50.0, 50.0)
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
    public func rotated(degrees: Float) -> AmazingHSBColor {
        let hue = AmazingHueHelpers.shared.rotated(hue: self.hue, degrees: degrees)
        
        return self.with(hue: hue)
    }
    
    /// Returns a new instance of a complementary color.
    ///
    /// Complementary color is calculated by rotating hue value by `180` degrees.
    ///
    /// ```
    /// let c = AmazingHSBColor(240.0, 50.0, 50.0)
    ///
    /// let c1 = c.complementary()
    /// // c1.hue == 60.0
    /// ```
    ///
    /// [What Are Complementary Colors?](https://www.color-meanings.com/complementary-colors)
    public func complementary() -> AmazingHSBColor {
        let hue = AmazingHueHelpers.shared.complementary(hue: self.hue)
        
        return self.with(hue: hue)
    }
    
    /// Returns new instances of split-complementary colors.
    ///
    /// Split-Complementary colors are calculated by rotating hue value by `-150` and `150` degrees.
    ///
    /// ```
    /// let c = AmazingHSBColor(50.0, 50.0, 50.0)
    ///
    /// let (c1, c2) = c.splitComplementary()
    /// // c1.hue == 260.0
    /// // c2.hue == 200.0
    /// ```
    ///
    /// [What Are Split-Complementary Colors?](https://www.color-meanings.com/split-complementary-colors)
    public func splitComplementary() -> (AmazingHSBColor, AmazingHSBColor) {
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
    /// let c = AmazingHSBColor(50.0, 50.0, 50.0)
    ///
    /// let (c1, c2) = c.triadic()
    /// // c1.hue == 290.0
    /// // c2.hue == 170.0
    /// ```
    ///
    /// [What Are Triadic Colors?](https://www.color-meanings.com/triadic-colors)
    public func triadic() -> (AmazingHSBColor, AmazingHSBColor) {
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
    /// let c = AmazingHSBColor(110.0, 50.0, 50.0)
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
    public func square() -> (AmazingHSBColor, AmazingHSBColor, AmazingHSBColor) {
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
    /// let c = AmazingHSBColor(90.0, 50.0, 50.0)
    ///
    /// let (c1, c2, c3) = c.rectangle()
    /// // c1.hue == 210.0
    /// // c2.hue == 270.0
    /// // c3.hue == 30.0
    /// ```
    ///
    /// [What Are Rectangle Colors?](https://www.color-meanings.com/rectangular-tetradic-color-schemes)
    public func rectangle() -> (AmazingHSBColor, AmazingHSBColor, AmazingHSBColor) {
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
    /// let c = AmazingHSBColor(10.0, 50.0, 50.0)
    ///
    /// let (c1, c2) = c.analogus()
    /// // c1.hue == 340.0
    /// // c2.hue == 40.0
    /// ```
    ///
    /// [What Are Analogous Colors?](https://www.color-meanings.com/analogous-colors)
    public func analogus() -> (AmazingHSBColor, AmazingHSBColor) {
        let hues = AmazingHueHelpers.shared.analogus(hue: self.hue)
        
        return (
            self.with(hue: hues.0),
            self.with(hue: hues.1)
        )
    }
}
