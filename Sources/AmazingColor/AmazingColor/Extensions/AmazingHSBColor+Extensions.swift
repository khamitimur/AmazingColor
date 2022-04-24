//
//  AmazingHSBColor+Extensions.swift
//  
//
//  Created by Timur Khamidov on 14.01.2022.
//

import AmazingColorHelpers

public extension AmazingHSBColor {
    
    // MARK: - Properties
    
    /// Returns a new instance of the RGB color model.
    var rgb: AmazingRGBColor {
        AmazingRGBColor(self.red, self.green, self.blue, self.alpha)
    }
    
    /// Returns a new instance of the HSL color model.
    var hsl: AmazingHSLColor {
        let (hue, saturation, lightness) = AmazingColorModelHelpers.shared.hsl(red: self.red, green: self.green, blue: self.blue)
        
        return AmazingHSLColor(hue, saturation, lightness, self.alpha)
    }
}
