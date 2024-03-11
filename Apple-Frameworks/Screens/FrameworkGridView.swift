//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Berkin KOCA on 11.03.2024.
//

import SwiftUI

struct FrameworkGridView: View {
     let columns: [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]
     
     var body: some View {
          
          LazyVGrid(columns: columns) {
               FrameworkTitleView(name: "App Clips", iconImage: Image(.appClip))
               FrameworkTitleView(name: "ArKit", iconImage: Image(.arkit))
               FrameworkTitleView(name: "CarPlay", iconImage: Image(.carplay))
               
               FrameworkTitleView(name: "Catalyst", iconImage: Image(.catalyst))
               FrameworkTitleView(name: "ClassKit", iconImage: Image(.classkit))
               FrameworkTitleView(name: "CloudKit", iconImage: Image(.cloudkit))
               
               
          }
     }
}

struct FrameworkTitleView: View {
     let name: String
     let iconImage: Image
     
     var body: some View {
          VStack {
               iconImage
                    .resizable()
                    .frame(width: 92, height: 92)
               
               Text(name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
          }
     }
}

#Preview {
     FrameworkGridView()
}
