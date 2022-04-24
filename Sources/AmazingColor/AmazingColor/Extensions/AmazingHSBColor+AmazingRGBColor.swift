//
//  AmazingHSBColor+AmazingRGBColor.swift
//  
//
//  Created by Timur Khamidov on 14.01.2022.
//

public extension AmazingHSBColor {
    
    // MARK: - Properties
    
    /// Returns a new instance of the ``AmazingRGBColor`` struct.
    var rgb: AmazingRGBColor {
        AmazingRGBColor(self.red, self.green, self.blue, self.alpha)
    }
}
