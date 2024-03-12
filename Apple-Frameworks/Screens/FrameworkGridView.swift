//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Berkin KOCA on 11.03.2024.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    @State private var selectedViewMode: Int = 0
    
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
    
    var body: some View {
        NavigationView {
            VStack {
                if selectedViewMode == 2 {
                    List(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.selectedFramework = framework
                                }
                            }
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(MockData.frameworks) { framework in
                                FrameworkTitleView(framework: framework)
                                    .onTapGesture {
                                        withAnimation {
                                            viewModel.selectedFramework = framework
                                        }
                                    }
                            }
                        }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                HStack(spacing: -4) {
                    Button(action: {
                        selectedViewMode = 0
                    }) {
                        SelectionImageView(selectedViewMode: $selectedViewMode, iconImage: SFSymbols.twoColumnIcon)
                    }
                    
                    Button(action: {
                        selectedViewMode = 1
                    }) {
                        Image(systemName: SFSymbols.threeColumnIcon)
                            .resizable()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(selectedViewMode == 1 ? Color.primary : Color.primary.opacity(0.5))
                            .frame(width: 16, height: 16)
                    }
                    .padding()
                    
                    Button(action: {
                        selectedViewMode = 2
                    }) {
                        Image(systemName: SFSymbols.listIcon)
                            .resizable()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(selectedViewMode == 2 ? Color.primary : Color.primary.opacity(0.5))
                            .frame(width: 16, height: 16)
                    }
                }
            }
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework!,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
        
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
            .foregroundStyle(selectedViewMode == 0 ? Color.primary : Color.primary.opacity(0.5))
            .frame(width: 16, height: 16)
    }
}


#Preview {
    FrameworkGridView()
}

