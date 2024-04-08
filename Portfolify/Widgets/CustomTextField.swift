//
//  CustomTextField.swift
//  Portfolify
//
//  Created by Ali Tamoor on 07/04/2024.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var fieldTxt: String
    var imageName: String
    var text: String
    
    var body: some View {
        HStack() {
            Image(systemName: imageName)
                .padding(.leading)
                .foregroundColor(.white)
            TextField("", text: $fieldTxt, prompt: Text(text).foregroundStyle(Color.white.opacity(0.60)), axis: .vertical)
                .lineLimit(5)
                .padding(.vertical)
                .tint(.white)
                .foregroundColor(.white)
        }
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.white), lineWidth: 1)
        )
        .padding(10)
    }
}
#Preview {
    SignUpView()
}
