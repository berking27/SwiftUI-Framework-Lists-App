//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Berkin Koca on 11.03.2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    var isListView: Bool
    @State var isShowingSafariView = false
    
    var body: some View {
        VStack {
            
            if !isListView {
                HStack{
                    Spacer()
                    Button {
                        isShowingDetailView = false
                    } label: {
                        AFDismissButton()
                    }
                }
                
                Spacer()
            }
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
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(true), isListView: true)
}
