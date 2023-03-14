//
//  OneToNumber_Button.swift
//  Roulette
//
//  Created by Abby on 2023/3/4.
//

import SwiftUI
import AVFoundation

struct OneToNumber_Button: View {
    let rule:String
    @Binding var Chose:Array<ChoseHalf>
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
            if rule == "1 - 18"{
                Chose.append(ChoseHalf(number: Array(1...18), money: amount))
            }
            if rule == "19 - 36"{
                Chose.append(ChoseHalf(number: Array(1...18), money: amount))
                }
        } label: {
            if IsClick{
                Text("\(rule)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
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
                    .font(.system(size: 25))
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

//struct OneToNumber_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        OneToNumber_Button()
//    }
//}
