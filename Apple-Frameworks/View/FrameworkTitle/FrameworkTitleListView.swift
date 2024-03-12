//
//  FrameworkTitleListView.swift
//  Apple-Frameworks
//
//  Created by Berkin KOCA on 12.03.2024.
//

import SwiftUI

struct FrameworkTitleListView: View {
    
    let framework: Framework
    
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 64, height: 64)
            
            Text(framework.name)
                .font(.title3)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding()
        }
        .padding()
    }
}

#Preview {
    FrameworkTitleListView(framework: MockData.sampleFramework)
}

