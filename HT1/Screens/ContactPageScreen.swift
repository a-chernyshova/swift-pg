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
    var contactManager: ContactScreenManager
    @EnvironmentObject
    var callScreenManager: CallScreenManager
    let x = 85.0
    
    var body: some View {
        VStack {
            HStack{
                ZStack{
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 152, height: 152)
                    /// get image name from the manager, if no image then use default icon
                    if (contactModel.imageName == "") {
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .shadow(color: .black, radius: 2)
                            .clipShape(Circle())
                    } else {
                        Image(contactModel.imageName)
                            .resizable()
    //                        .cornerRadius(90.0)
                            .clipShape(Circle())
                            .frame(width: 152, height: 152)
                    }
                }
            }.padding(20)
            Text("\(contactModel.firstName) \(contactModel.secondName)")
                .font(.largeTitle)
                .colorInvert()
            HStack {
                Spacer()
                ContactPageActionButton(buttonTitle: "Message", buttonImgSystemName: "message.fill", action:{})
                ContactPageActionButton(buttonTitle: "Call", buttonImgSystemName: "phone.fill", action: {
                    callScreenManager.contact = contactModel
//                    callScreenManager.isScreenVisible = true
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
                }.padding(.horizontal, 32)
                    .frame(height: 66)
            }
            
            BlockContactButton(isAccountBlocked: contactModel.isAccountBlocked)
                .padding(10)
                .frame(width: 300)
            Spacer()
            Button(action: { contactManager.deleteContact(contactToDelete: contactModel)}) {
                // todo: how do I switch back to list of all contacts?
                ZStack {
                    Rectangle()
                        .cornerRadius(8.0)
                        .foregroundColor(.red)
                    Text("Delete the user")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 50)
                .frame(height: 46)
        }.foregroundColor(.white)
    }
}

struct ContactPageScreen_Previews: PreviewProvider {
    static var previews: some View {
        let neo = ContactModel(
            id: UUID(), firstName: "Thomas", secondName: "Anders", phoneNumber: "+49 (151) 630-55555", imageName: "1", isAccountBlocked: false
        )
        
        ContactPageScreen(contactModel: neo)
            .environmentObject(CallScreenManager())
    }
}
