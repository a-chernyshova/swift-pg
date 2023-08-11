//
//  CallPageScreen.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 07.08.23.
//

import SwiftUI

struct CallPageScreen: View {
    //MARK: props
    var phoneNumber: String
    
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
                    Text(phoneNumber)
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
                                         state: true).opacity(0.5)
                    CallPageActionButton(buttonImgSystemName: "video.fill",
                                         oppositeButtonImgSystemName: "video.slash",
                                         buttonText: "video",
                                         oppositeText: "no video",
                                         backgroundColor: .gray,
                                         state: true).opacity(0.5)
                    CallPageActionButton(buttonImgSystemName: "airpods",
                                         oppositeButtonImgSystemName: "speaker.wave.3",
                                         buttonText: "airpods",
                                         oppositeText: "speaker",
                                         backgroundColor: .gray,
                                         state: true).opacity(0.5)
                }
                HStack{
                    CallPageActionButton(buttonImgSystemName: "phone.down.fill",
                                         oppositeButtonImgSystemName: "phone.down.fill",
                                         backgroundColor: .red,
                                         state: true)
                    .padding(.vertical, 64)
                    //                ZStack{
                    //                    Circle()
                    //                        .frame(width: 84, height: 84)
                    //                        .foregroundColor(.red)
                    //                    Image(systemName: "phone.down.fill")
                    //                        .scaledToFit()
                    //                        .padding(1)
                    //                        .foregroundColor(.white)
                    //                    }
                }
                Spacer()
            }
        }
    }
}

struct CallPageScreen_Previews: PreviewProvider {
    static var previews: some View {
        CallPageScreen(phoneNumber: "+7(960)-239-91-61")
    }
}
