//
//  ContactPageScreen.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 03.08.23.
//

import SwiftUI

struct ContactPageScreen: View {
    
    /// contact model
    var contactModel: ContactModel
    
    @EnvironmentObject
    var callScreenManager: CallScreenManager
    
    let x = 85.0
    
    @State
    var isAccountBlocked: Bool
    
    var body: some View {
        VStack {
            HStack{
                ZStack{
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 145, height: 145)
                        .shadow(color: .black, radius: 2)
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .shadow(color: .black, radius: 2)
                }
            }.padding(20)
            Text("\(contactModel.firstName) \(contactModel.secondName)")
                .font(.largeTitle)
                .colorInvert()
            HStack {
                Spacer()
                ContactPageActionButton(buttonTitle: "Message", buttonImgSystemName: "message.fill", action:{})
                ContactPageActionButton(buttonTitle: "Call", buttonImgSystemName: "phone.fill", action: {
                    callScreenManager.contact = contactModel;
                    callScreenManager.isScreenVisible = true
                })
                ContactPageActionButton(buttonTitle: "Video", buttonImgSystemName: "video.fill", action: {})
                ContactPageActionButton(buttonTitle: "eMail", buttonImgSystemName: "envelope.fill", action: {})
                Spacer()
            }
            .padding(10)
            HStack{
                ZStack{
                    Rectangle()
                        .cornerRadius(8.0)
                        .foregroundColor(.gray)
                    VStack{
                        HStack{
                            Text("phone number").foregroundColor(.white)
                                .padding(.horizontal, 24)
                            Spacer()
                        }
                        HStack{
                            Text(contactModel.phoneNumber).foregroundColor(.blue)
                                .padding(.horizontal, 24)
                            Spacer()
                        }
                    }
                }.padding(.horizontal, 12)
                    .frame(height: 66)
            }
            
            BlockContactButton(isAccountBlocked: false)
                .padding(10)
            Spacer()
        }.foregroundColor(.white)
    }
}

struct ContactPageScreen_Previews: PreviewProvider {
    static var previews: some View {
        let neo = ContactModel(
            id: UUID(), firstName: "Thomas", secondName: "Anderson", phoneNumber: "+49 (151) 630-57558"
        )
        
        ContactPageScreen(contactModel: neo, isAccountBlocked: false)
            .environmentObject(CallScreenManager())
    }
}
