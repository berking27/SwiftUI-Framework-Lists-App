//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by Berkin Koca on 11.03.2024.
//

import SwiftUI

struct AFButton: View {
    
    var title: String
    var titleColor: Color
    var backgroundColor: Color
    
    var body: some View {
        
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundStyle(titleColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    AFButton(title: "Test Title",titleColor: .white, backgroundColor: .red)
}
