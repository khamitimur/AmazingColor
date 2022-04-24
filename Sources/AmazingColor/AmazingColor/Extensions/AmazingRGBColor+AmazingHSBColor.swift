//
//  AmazingRGBColor+AmazingHSBColor.swift
//  
//
//  Created by Timur Khamidov on 14.01.2022.
//

import AmazingColorHelpers

public extension AmazingRGBColor {
    
    // MARK: - Properties
    
    /// Returns a new instance of the HSB color model.
    var hsb: AmazingHSBColor {
        let (hue, saturation, brightness) = AmazingColorModelHelpers.shared.hsb(red: self.red, green: self.green, blue: self.blue)
        
        return AmazingHSBColor(hue, saturation, brightness, self.alpha)
    }
    
    /// Returns a new instance of the HSL color model.
    var hsl: AmazingHSLColor {
        let (hue, saturation, lightness) = AmazingColorModelHelpers.shared.hsl(red: self.red, green: self.green, blue: self.blue)
        
        return AmazingHSLColor(hue, saturation, lightness, self.alpha)
    }
}
