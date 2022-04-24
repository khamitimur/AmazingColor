//
//  AmazingHSLColor+Extensions.swift
//  
//
//  Created by Тимур Хамидов on 24.04.2022.
//

import AmazingColorHelpers

public extension AmazingHSLColor {
    
    // MARK: - Properties
    
    /// Returns a new instance of the RGB color model.
    var rgb: AmazingRGBColor {
        AmazingRGBColor(self.red, self.green, self.blue, self.alpha)
    }
    
    /// Returns a new instance of the HSB color model.
    var hsb: AmazingHSBColor {
        let (hue, saturation, brightness) = AmazingColorModelHelpers.shared.hsb(red: self.red, green: self.green, blue: self.blue)
        
        return AmazingHSBColor(hue, saturation, brightness, self.alpha)
    }
}
