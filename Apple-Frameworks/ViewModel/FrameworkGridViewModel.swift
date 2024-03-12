//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Berkin Koca on 12.03.2024.
//

import Foundation

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    
    @Published var isShowingDetailView: Bool = false
    
}
