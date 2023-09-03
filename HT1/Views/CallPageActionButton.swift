//
//  CallPageActionButton.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 07.08.23.
//

import SwiftUI

struct CallPageActionButton: View {
    // MARK: Properties
    let buttonImgSystemName: String
    let oppositeButtonImgSystemName: String
    var buttonText: String?
    var oppositeText: String?
    let backgroundColor: Color
    @State
    var state: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: { action() }, label: {
            VStack{
                if (state) {
                    ZStack{
                        Circle()
                            .frame(width: 84, height: 84)
                            .foregroundColor(backgroundColor)
//                            .opacity(0.5)
                        Image(systemName: buttonImgSystemName)
                        /// todo: why doesn't work with different picture? resized not proportinally
//                            .resizable()
//                            .frame(width: 18, height: 24)
                            .scaledToFit()
                            .padding(1)
                            .foregroundColor(.white)
                        }
                    if buttonText != nil {
                        Text(buttonText!).foregroundColor(.white )
                    }
                } else {
                    ZStack{
                    Circle()
                        .frame(width: 84, height: 84)
                        .foregroundColor(backgroundColor)
                        .opacity(0.2)
                    Image(systemName: oppositeButtonImgSystemName)
//                        .resizable()
//                        .frame(width: 18, height: 24)
                        .padding(1)
                        .foregroundColor(.black)
                    }
                    if oppositeText != nil {
                        Text(oppositeText!).foregroundColor(.white )
                    }
                }
            }.padding(10)
        })
    }
}

struct CallPageActionButton_Previews: PreviewProvider {
    static var previews: some View {
        CallPageActionButton(
            buttonImgSystemName: "mic.fill",
            oppositeButtonImgSystemName: "mic.slash",
            buttonText: "mute",
            oppositeText: "unmute",
            backgroundColor: .gray,
            state: false,
            action: {}
        )
            .previewLayout(.sizeThatFits)
            .background(.gray)
    }
}
