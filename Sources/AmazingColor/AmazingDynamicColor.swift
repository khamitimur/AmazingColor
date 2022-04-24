//
//  AmazingDynamicColor.swift
//
//
//  Created by Тимур Хамидов on 03.01.2022.
//

/// User interface theme dependent dynamic color model.
public struct AmazingDynamicColor {
    
    // MARK: - Public Properties
    
    /// Gets a color to use with a light theme.
    public let lightThemeColor: AnyAmazingColor

    /// Gets a color to use with a dark theme.
    public let darkThemeColor: AnyAmazingColor?

    // MARK: - Initializers
    
    /// Initializes a new instance with the provided colors.
    /// - Parameters:
    ///   - lightThemeColor: Color to use with a light theme.
    ///   - darkThemeColor: Color to use with a dark theme.
    public init(lightThemeColor: AnyAmazingColor, darkThemeColor: AnyAmazingColor? = nil) {
        self.lightThemeColor = lightThemeColor
        self.darkThemeColor = darkThemeColor
    }
}
