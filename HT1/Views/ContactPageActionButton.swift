//
//  ContactPageActionButton.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 03.08.23.
//

import SwiftUI

struct ContactPageActionButton: View {
    // MARK: Properties
    let buttonTitle: String
    let buttonImgSystemName: String
    /// action button click
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            ZStack{
                Rectangle()
                    .cornerRadius(12)
                    .frame(width: 85, height: 85)
                    .foregroundColor(.gray)
                VStack{
                    Image(systemName: buttonImgSystemName)
                        .padding(1)
                        .shadow(color: .black, radius: 2)
                        .foregroundColor(.white)
                    Text(buttonTitle)
                }
            }
        }
    }
}

struct ContactPageActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ContactPageActionButton(
            buttonTitle: "Message",
            buttonImgSystemName: "message.fill",
            action: {}
        )
        .previewLayout(.sizeThatFits)
    }
}
