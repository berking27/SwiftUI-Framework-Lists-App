//
//  AFDismissButton.swift
//  Apple-Frameworks
//
//  Created by Berkin KOCA on 12.03.2024.
//

import SwiftUI

struct AFDismissButton: View {
    var body: some View {
        Image(systemName: SFSymbols.closeIcon)
            .foregroundStyle(Color(.label))
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .padding()
    }
}

#Preview {
    AFDismissButton()
}
