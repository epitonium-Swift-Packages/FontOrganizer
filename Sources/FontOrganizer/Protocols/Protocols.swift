//
//  Protocols.swift
//  FontOrganizer
//
//  Created by Vitalis on 08/03/2019.
//

/// Protocol used to implement primary font name behaviour of the Font used by FontOrganizer.
public protocol PrimaryFontable {
    
    //  MARK: PROPERTIES
    // /////////////////////////////////////
    
    /// Primary font name used by FontOrganizer's font getters.
    ///
    /// Use it inside Font structure extension as follows:
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
    static var primary: Font { get }
}
