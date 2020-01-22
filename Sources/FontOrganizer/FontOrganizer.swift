//
//  FontOrganizer.swift
//  FontOrganizer
//
//  Created by Vitalis on 08/03/2019.
//

import UIKit

// ...........

open class FontOrganizer {
    
    //  MARK: PROPERTIES 🌐 PUBLIC
    // /////////////////////////////////////////
    
    /// Separator used to separate the font name from the font style descriptions on font creation.
    ///
    /// Default value is "-". If Font.name is "tahoma" and FontStyle.name is "thin" then requesting the font tahoma with the thin style the Manager will search for "tahoma-thin" font inside the bundle.
    public static var fontNameStyleSeparator: String {
        return "-"
    }
    
    /// Get font with the specified style, and size. If there is no font specified then system font will be used instead.
    ///
    /// You can set primary font and skip entering font parameter everytime in this method by making Font structure conforming to PrimaryFontable protocol and returning your font with the 'primary' variable:
    /// ````
    /// extension Font: PrimaryFontable {
    ///     public static var primary: Font {
    ///         return roboto
    ///     }
    ///
    ///     static let roboto = Font(name: "Roboto", styles: [.light])
    ///     ...
    /// }
    /// ````
    ///
    /// - Parameters:
    ///   - style: Font style
    ///   - size: Font size
    ///   - font: Font
    /// - Returns: Custom font from the bundle with given values or system font on failure.
    open class func font(withStyle style: FontStyle, andSize size: CGFloat, font: Font? = nil) -> UIFont {
        
        // 🚜 TODO: REFACTOR THIS METHOD
        
        guard let passedInFont = font else {
            
            if let PrimaryFontable = Font.self as? PrimaryFontable.Type {
                
                let primaryFont = PrimaryFontable.primary
                
                return fontWithSystemFallback(ofSize: size, style: style, font: primaryFont)
                
            } else {
                return systemFont(forSize: size, andWeight: style.weight)
            }
        }

        guard passedInFont.supportedStyles.contains(style) else {
            // 🚜 TODO: ADD CUSTOM LOG
            print("FONT STYLE '\(style.name)' FOR '\(passedInFont.name)' FONT IS NOT SUPPORTED")
            return systemFont(forSize: size, andWeight: style.weight)
        }
        
        return fontWithSystemFallback(ofSize: size, style: style, font: passedInFont)
    }
    
    // ...........
    
    /// Get font with exact name as string, and size.
    ///
    /// - Parameters:
    ///   - name: Font name
    ///   - size: Font size
    /// - Returns: Custom font from the bundle with given values or system font on failure.
    open class func font(withName name: String, andSize size: CGFloat) -> UIFont {
        
        guard let exactFont = UIFont(name: name, size: size) else {
            // 🚜 TODO: ADD CUSTOM LOG
            print("\(name) FONT IS NOT INSTALLED, MAKE SURE IT IS ADDED IN Info.plist AND LOGGED WITH Utility.logAllAvailableFonts()")
            return systemFont(forSize: size, andWeight: .regular)
        }
        
        return exactFont
    }

    //  MARK: METHODS 🔰 PRIVATE
    // ///////////////////////////////////////////

    /// Internal custom font getter.
    ///
    /// - Parameters:
    ///   - fontSize: Font size
    ///   - style: Font style
    ///   - font: Font
    /// - Returns: Attempts to get custom font from the bundle with given values. Returns system font on failure.
    private static func fontWithSystemFallback(ofSize fontSize: CGFloat, style: FontStyle, font: Font) -> UIFont {
        
        guard font.supportedStyles.contains(style) else {
            // 🚜 TODO: ADD CUSTOM LOG
            print("FONT STYLE '\(style.name)' FOR '\(font.name)' FONT IS NOT SUPPORTED")
            return systemFont(forSize: fontSize, andWeight: style.weight)
        }
        
        return customFont(ofSize: fontSize, style: style, fontName: font.name) ?? systemFont(forSize: fontSize, andWeight: style.weight)
    }
    
    // ...........

    /// Request system font with specific size and style
    ///
    /// - Parameters:
    ///   - fontSize: Font size
    ///   - weight: Font weight
    /// - Returns: System font with given values.
    private static func systemFont(forSize fontSize: CGFloat, andWeight weight: UIFont.Weight?) -> UIFont {
        return UIFont.systemFont(ofSize: fontSize, weight: weight ?? .regular)
    }

    // ...........

    /// Constructs final font name from given values and attempts to get custom font from the bundle.
    ///
    /// - Parameters:
    ///   - fontSize: Font size
    ///   - style: Font style
    ///   - fontName: Font name
    ///
    /// If font name is "tahoma" and FontStyle.name is "thin" then the Manager will search for "tahoma-thin" font inside the bundle. The "-" charachter between name and style is specified as fontNameStyleSeparator variable inside FontOrganizer.
    /// - Returns: Custom font from the bundle or system font on failure.
    private static func customFont(ofSize fontSize: CGFloat, style: FontStyle, fontName: String) -> UIFont? {
        let finalFontName = fontName + fontNameStyleSeparator + "\(style.name)"
        return font(withName: finalFontName, andSize: fontSize)
    }
}
