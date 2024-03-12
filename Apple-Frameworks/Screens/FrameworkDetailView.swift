//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Berkin Koca on 11.03.2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @State var isShowingSafariView = false
    var framework: Framework
    
    
    var body: some View {
        VStack {
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button(action: {
                isShowingSafariView = true
            }, label: {
                AFButton(title: "Learn More",
                         titleColor: .white,
                         backgroundColor: .red)
//                Label("Learn More", systemImage: "book.fill")
            })
//            .buttonStyle(.borderedProminent)
//            .controlSize(.large)
//            .tint(.red)
            
            
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
