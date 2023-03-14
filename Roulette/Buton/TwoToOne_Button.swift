//
//  TwoToOne_Button.swift
//  Roulette
//
//  Created by Abby on 2023/3/4.
//

import SwiftUI
import AVFoundation

struct TwoToOne_Button: View {
    var rule:String
    let W:CGFloat
    let H:CGFloat
    @Binding var Chose:Array<ChoseTwoToOne>
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
            if rule == "1st 12"{
                Chose.append(ChoseTwoToOne(number: Array(1...12), money: amount))
            }
            if rule == "2nd 12"{
                Chose.append(ChoseTwoToOne(number: Array(13...24), money: amount))
            }
            if rule == "3rd 12"{
                Chose.append(ChoseTwoToOne(number: Array(25...36), money: amount))
            }
        } label: {
            if IsClick{
                Text("\(rule)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .frame(width: W,height: H)
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
                    .frame(width: W,height: H)
                    .background(.green)
            }
        }.onChange(of: IsClear) { newValue in
            if newValue{
                IsClick=false
            }
        }
    }
}

//struct TwoToOne_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        TwoToOne_Button()
//    }
//}
