//
//  ContactCommonButton.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 15.09.23.
//

import SwiftUI

struct ContactCommonButton: View {
    var buttonColor: Color
    var textColor: Color
    var buttonText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(8.0)
                .foregroundColor(buttonColor)
            Text(buttonText)
                .foregroundColor(textColor)
        }
        .frame(height: 46)
        .padding(.horizontal, 50)
    }
}

struct ContactCommonButton_Previews: PreviewProvider {
    static var previews: some View {
        ContactCommonButton(buttonColor: .gray, textColor: .green, buttonText: "Test")
    }
}
