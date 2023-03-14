//
//  Color_Button.swift
//  Roulette
//
//  Created by Abby on 2023/3/4.
//

import SwiftUI
import AVFoundation

struct Color_Button: View {
    let rule:String
    let colors:Color
    @Binding var Chose:Array<ChoseColor>
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
            Chose.append(ChoseColor(color: [colors], money: amount))
        } label: {
            if IsClick{
                Image(systemName: rule)
                    .resizable()
                    .frame(width: 80,height: 30)
                    .foregroundColor(colors)
                    .fontWeight(.bold)
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
                Image(systemName: rule)
                    .resizable()
                    .frame(width: 80,height: 30)
                    .foregroundColor(colors)
                    .fontWeight(.bold)
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

//struct Color_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Color_Button()
//    }
//}
