//
//  TouchPadScreen.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 14.08.23.
//

import SwiftUI

struct TouchPadScreen: View {
    @State
    var tempString: String = ""
    @EnvironmentObject
    var callScreenManager: CallScreenManager
    
    var keyBorad = ["1": "", "2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
    
    var body: some View {
        VStack{
            Spacer()
            Text(tempString).padding(36)
            HStack{
                ForEach(Array(keyBorad.keys.sorted()[...2]), id: \.self) { key in
                    VStack{
                        DigitButton(buttonTitle: key, buttonText: keyBorad[key], action: {
                            tempString.append(key)
                        })
                    }
                }
            }
            HStack{
                ForEach(Array(keyBorad.keys.sorted()[3...5]), id: \.self) { key in
                    VStack{
                        DigitButton(buttonTitle: key, buttonText: keyBorad[key], action: {tempString.append(key)})
                    }
                }
            }
            HStack{
                ForEach(Array(keyBorad.keys.sorted()[6...]), id: \.self) { key in
                    VStack{
                        DigitButton(buttonTitle: key, buttonText: keyBorad[key], action: {tempString.append(key)})
                    }
                }
            }
            HStack{
                VStack{
                    DigitButton(buttonTitle: "*", action: {}
                )}
                VStack{
                    DigitButton(buttonTitle: "0", buttonText: "abc", action: {tempString.append("0")}
                )}
                VStack{
                    DigitButton(buttonTitle: "#", action: {}
                )}
            }
            HStack{
                CallPageActionButton(buttonImgSystemName: "phone.fill",
                                     oppositeButtonImgSystemName: "phone.down.fill",
                                     backgroundColor: .green,
                                     state: true,
                                     action: {
                                        callScreenManager.contact = nil
                                        callScreenManager.isScreenVisible = true
                    })
                .padding(.vertical, 64)
            }
        }
    }
}

struct TouchPadScreen_Previews: PreviewProvider {
    static var previews: some View {
        TouchPadScreen()
            .environmentObject(CallScreenManager())
    }
}
