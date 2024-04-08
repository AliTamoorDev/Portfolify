//
//  Extensions.swift
//  Portfolify
//
//  Created by Ali Tamoor on 08/04/2024.
//

import Foundation
import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(gradient: Gradient(colors: [.primaryBrandBG.opacity(0.9), .navy.opacity(0.9), .gray.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottom)
                    .ignoresSafeArea()
            )
    }
}

extension View {
    func backgroundGradient() -> some View {
        self.modifier(BackgroundModifier())
    }
}
