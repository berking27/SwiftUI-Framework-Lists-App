//
//  Constants.swift
//  Apple-Frameworks
//
//  Created by Berkin KOCA on 12.03.2024.
//

import Foundation
import SwiftUI

enum SFSymbols {
    static let twoColumnIcon = "rectangle.grid.3x2.fill"
    static let threeColumnIcon = "rectangle.grid.2x2.fill"
    static let listIcon = "list.bullet"
    static let closeIcon = "xmark"
}


enum Columns {
    static let twoColumn: [GridItem] = [GridItem(.flexible()),
                                        GridItem(.flexible())]
    
    static let threeColumn: [GridItem] = [GridItem(.flexible()),
                                        GridItem(.flexible()),
                                        GridItem(.flexible())]
}
