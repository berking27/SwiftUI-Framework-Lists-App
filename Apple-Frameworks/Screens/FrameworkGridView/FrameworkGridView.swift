//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Berkin KOCA on 11.03.2024.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @State private var selectedViewMode: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                if selectedViewMode == 2 {
                    List(MockData.frameworks) { framework in
                        NavigationLink(destination: FrameworkDetailView(framework: framework)) {
                            FrameworkTitleListView(framework: framework)
                        }
                    }
                    .listStyle(.inset)
                    
                } else {
                    ScrollView {
                        CustomColumGridView(selectedViewMode: $selectedViewMode)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .navigationDestination(for: Framework.self, destination: { framework in
                FrameworkDetailView(framework: framework)
            })
            .toolbar {
                RightToolBarView(selectedViewMode: $selectedViewMode)
            }
        }
        .accentColor(Color.primary)
    }
}




//MARK: Extracted Views

struct SelectionImageView: View {
    @Binding var selectedViewMode: Int
    var iconImage: String
    
    var body: some View {
        Image(systemName: iconImage)
            .resizable()
            .symbolRenderingMode(.palette)
            .frame(width: 16, height: 16)
    }
}

struct RightToolBarView: View {
    
    @Binding var selectedViewMode: Int
    
    var body: some View {
        HStack(spacing: -4) {
            Button(action: {
                selectedViewMode = 0
            }) {
                SelectionImageView(selectedViewMode: $selectedViewMode, iconImage: SFSymbols.twoColumnIcon)
                    .foregroundStyle(selectedViewMode == 0 ? Color.primary : Color.primary.opacity(0.3))
            }
            
            Button(action: {
                selectedViewMode = 1
            }) {
                SelectionImageView(selectedViewMode: $selectedViewMode, iconImage: SFSymbols.threeColumnIcon)
                    .foregroundStyle(selectedViewMode == 1 ? Color.primary : Color.primary.opacity(0.3))
            }
            .padding()
            
            Button(action: {
                selectedViewMode = 2
            }) {
                SelectionImageView(selectedViewMode: $selectedViewMode, iconImage: SFSymbols.listIcon)
                    .foregroundStyle(selectedViewMode == 2 ? Color.primary : Color.primary.opacity(0.3))
                    .bold()
            }
        }
    }
}

struct CustomColumGridView: View {
    
    private var columns: [GridItem] {
        switch selectedViewMode {
        case 0:
            return Columns.twoColumn
        case 1:
            return Columns.threeColumn
        default:
            return []
        }
    }
    
    @Binding var selectedViewMode: Int
//    @ObservedObject var viewModel: FrameworkGridViewModel
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(MockData.frameworks) { framework in
                NavigationLink(value: framework) {
                    FrameworkTitleView(framework: framework)
                }
//                    .onTapGesture {
//                        withAnimation {
//                            viewModel.selectedFramework = framework
//                        }
//                    }
            }
        }
    }
}


#Preview {
    FrameworkGridView()
}
