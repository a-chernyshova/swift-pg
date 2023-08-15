//
//  DigitButton.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 14.08.23.
//

import SwiftUI

struct DigitButton: View {
    // MARK: Properties
    let buttonTitle: String
    var buttonText: String?
    /// action button click
    let action: () -> Void
    var body: some View {
        Button(action: action){
            ZStack{
                Circle()
                    .frame(width: 85, height: 85)
                    .foregroundColor(.gray)
                VStack{
                    Text(buttonTitle)
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                        .padding(1)
                        .foregroundColor(.white)
                    if buttonText != nil {
                        Text(buttonText!)
                            .padding(1)
                            .shadow(color: .black, radius: 2)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct DigitButton_Previews: PreviewProvider {
    static var previews: some View {
        DigitButton(
            buttonTitle: "1",
//            buttonText: "abc",
            action: {}
        )
        .previewLayout(.sizeThatFits)
    }
}
