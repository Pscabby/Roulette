//
//  OddEven_Button.swift
//  Roulette
//
//  Created by Abby on 2023/3/4.
//

import SwiftUI
import AVFoundation

struct OddEven_Button: View {
    let rule:String
    @Binding var Chose:Array<ChoseOdd>
    @Binding var amount:Int
    @Binding var IsClear:Bool
    @State private var IsClick = false
    @State var ShowChips = ""
    @State private var player = AVPlayer()
    @EnvironmentObject var chips:Chips
    var body: some View {
        Button {
            let url = Bundle.main.url(forResource: "coin", withExtension: "mp3")!
                            let playerItem = AVPlayerItem(url: url)
                            player.replaceCurrentItem(with: playerItem)
                            player.play()
            player.volume = 1.5
            IsClick=true
            ShowChips=String(amount)
            chips.total+=amount
            chips.budget-=amount
            if rule == "Even"{
                Chose.append(ChoseOdd(number: [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36], money: amount))
            }
            if rule == "Odd"{
                Chose.append(ChoseOdd(number: [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35], money: amount))
            }
        } label: {
            if IsClick{
                Text("\(rule)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .frame(width: 109,height: 50)
                    .background(.green)
                    .overlay {
                        Image(ShowChips)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                    }
            }
            else{
                Text("\(rule)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .frame(width: 109,height: 50)
                    .background(.green)
            }
        }.onChange(of: IsClear) { newValue in
            if newValue{
                IsClick=false
            }
        }
    }
}

//struct OddEven_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        OddEven_Button()
//    }
//}
