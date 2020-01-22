//
//  Font.swift
//  FontOrganizer
//
//  Created by Vitalis on 08/03/2019.
//

/// Structure to represent font as name
public struct Font {
    
    //  MARK: PROPERTIES 🌐 PUBLIC
    // /////////////////////////////////////
    
    /// Font name
    public var name: String
    
    /// Font styles list supported by the font
    public var supportedStyles: Set<FontStyle>
    
    //  MARK: INITS 🌐 PUBLIC
    // /////////////////////////////////////

    /// Initialize Font with name and supported styles
    ///
    /// - Parameters:
    ///   - name: Font name
    ///   - styles: supported styles list
    public init(name: String, styles: Set<FontStyle>) {
        self.name = name
        self.supportedStyles = styles
    }
}
