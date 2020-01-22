//
//  FontStyle.swift
//  FontOrganizer
//
//  Created by Vitalis on 08/03/2019.
//

import UIKit

/// Structure to represent font's style
public struct FontStyle: Hashable {
    
    //  MARK: PROPERTIES 🌐 PUBLIC
    // /////////////////////////////////////
    
    /// Font style name
    public var name: String
    
    /// Font weight
    public var weight: UIFont.Weight?
    
    //  MARK: INITS 🌐 PUBLIC
    // /////////////////////////////////////

    /// Initialize FontStyle with name and optional weight
    ///
    /// - Parameters:
    ///   - name: Font name
    ///   - weight: Font weight
    public init(withName name: String, weight: UIFont.Weight? = nil) {
        self.name  = name
        self.weight = weight
    }
}
