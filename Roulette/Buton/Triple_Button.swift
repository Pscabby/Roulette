//
//  Triple_Button.swift
//  Roulette
//
//  Created by Abby on 2023/3/8.
//

import SwiftUI
import AVFoundation

struct Triple_Button: View {
    let rule:String
    @Binding var Chose:Array<ChoseTriple>
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
            IsClick = true
            ShowChips = String(amount)
            chips.total+=amount
            chips.budget-=amount
            if rule == "1'2to1"{
                Chose.append(ChoseTriple(number: [3,6,9,12,15,18,21,24,27,30,33,36], money: amount))
            }
            if rule == "2'2to1"{
                Chose.append(ChoseTriple(number: [2,5,8,11,14,17,20,23,26,29,32,35], money: amount))
            }
            if rule == "3'2to1"{
                Chose.append(ChoseTriple(number: [1,4,7,10,13,16,19,22,25,28,31,34], money: amount))
            }
            
        } label: {
            if IsClick{
                Text("\(rule)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    //.font(.system(size: 15))
                    .frame(width: 70,height: 50)
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
                    //.font(.system(size: 30))
                    .frame(width: 70,height: 50)
                    .background(.green)
            }
        }.onChange(of: IsClear) { newValue in
            if newValue{
                IsClick=false
            }
        }
    }
}

//struct Triple_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Triple_Button()
//    }
//}
