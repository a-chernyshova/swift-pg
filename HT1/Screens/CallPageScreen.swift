//
//  CallPageScreen.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 07.08.23.
//

import SwiftUI

struct CallPageScreen: View {
    //MARK: props
    // support calling existing contact or a new phonenumber, one or another should be passed to the view
    var contactModel: ContactModel?
    var phoneNumber: String?
    
    @EnvironmentObject
    var callScreenManager: CallScreenManager
    
    var body: some View {
        ZStack{
            LinearGradient(
                colors:[
                    Color(red: 0.141, green: 0.294, blue: 0.259),
                    Color(red: 0.098, green: 0.153, blue: 0.298)
                ],
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea(.all)
            VStack{
                HStack{
                    ZStack{
                        Circle()
                            .foregroundColor(.gray)
                            .frame(width: 121, height: 121)
                            .shadow(color: .black, radius: 2)
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .shadow(color: .black, radius: 2)
                    }
                }.padding(.vertical, 42)
                HStack{
                    Text(chooseTextToDisplay())
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                HStack{
                    Text("calling...")
                        .foregroundColor(.gray)
                }
                HStack{
                    CallPageActionButton(buttonImgSystemName: "mic.fill",
                                         oppositeButtonImgSystemName: "mic.slash",
                                         buttonText: "mute",
                                         oppositeText: "unmute",
                                         backgroundColor: .gray,
                                         state: true,
                                         action: {}).opacity(0.5)
                    CallPageActionButton(buttonImgSystemName: "video.fill",
                                         oppositeButtonImgSystemName: "video.slash",
                                         buttonText: "video",
                                         oppositeText: "no video",
                                         backgroundColor: .gray,
                                         state: true,
                                         action: {}).opacity(0.5)
                    CallPageActionButton(buttonImgSystemName: "airpods",
                                         oppositeButtonImgSystemName: "speaker.wave.3",
                                         buttonText: "airpods",
                                         oppositeText: "speaker",
                                         backgroundColor: .gray,
                                         state: true,
                                         action: {}).opacity(0.5)
                }
                HStack{
                    CallPageActionButton(buttonImgSystemName: "phone.down.fill",
                                         oppositeButtonImgSystemName: "phone.down.fill",
                                         backgroundColor: .red,
                                         state: true,
                                         action: {
                                            callScreenManager.contact = nil
                                            callScreenManager.isScreenVisible = false
                        })
                    .padding(.vertical, 64)
                }
                Spacer()
            }
        }
    }
    
    func chooseTextToDisplay() -> String {
        if (contactModel != nil) {
            return "\(contactModel!.firstName) \(contactModel!.secondName)"
        } else if (phoneNumber != nil) {
            return (phoneNumber)!
        } else {
            return "ERROR"
        }
    }
}

struct CallPageScreen_Previews: PreviewProvider {
    static var previews: some View {
        let neo = ContactModel(
            id: UUID(), firstName: "Thomas", secondName: "Anderson", phoneNumber: "+49 (151) 630-57558", imageName: "2", isAccountBlocked: false, isFavorite: true
        )
//        CallPageScreen(contactModel: neo).environmentObject(CallScreenManager())
        CallPageScreen(phoneNumber: "+49 150 444 345").environmentObject(CallScreenManager())
    }
}
