//
//  Number_Button.swift
//  Roulette
//
//  Created by Abby on 2023/3/4.
//

import SwiftUI
import AVFoundation

struct Number_Button: View {
    let number:Tables
    @Binding var Chose:Array<ChoseNumber>
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
            Chose.append(ChoseNumber(number: [number.number], money: amount))
        } label: {
            if IsClick{
                Text("\(number.number)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 50,height: 50)
                    .background(number.color)
                    .background(.white)
                    .overlay {
                        Image(ShowChips)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                    }
                    
            }
            else{
                Text("\(number.number)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 50,height: 50)
                    .background(number.color)
                    .background(.white)
            }
        }.onChange(of: IsClear) { newValue in
            if newValue{
                IsClick=false
            }
        }

    }
}

//struct Number_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Number_Button()
//    }
//}
