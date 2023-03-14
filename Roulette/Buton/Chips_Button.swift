//
//  Money_Button.swift
//  Roulette
//
//  Created by Abby on 2023/3/4.
//

import SwiftUI

struct Chips_Button: View {
    let imoney:Int
    @Binding var amount:Int
    @State private var IsChose=false
    var body: some View {
        VStack{
            Button {
                amount=imoney
                IsChose=true
            } label: {
                if IsChose{
                    Circle()
                        .foregroundColor(.brown)
                        .frame(width: 85,height:85)
                        .overlay {
                            Image(String(imoney))
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 80,height: 80)
                        }
                    
                }
                else{
                    Image(String(imoney))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 80,height: 80)
                }
            }
//            VStack(alignment: .center){
//                Text("\(amount)")
//                    .font(.system(size: 20))
//                    .fontWeight(.bold)
//                Stepper("",onIncrement: {
//                    amount += 1
//                    total.total += imoney
//                }, onDecrement: {
//                    amount -= 1
//                    total.total -= imoney
//                })
//            }
        }
    }
}

//struct Money_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Money_Button()
//    }
//}
