//
//  ContentView.swift
//  Roulette
//
//  Created by Abby on 2023/3/1.
///Users/abby/Downloads

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var table1=[
        Tables(number: 3, color: .red),
        Tables(number: 6, color: .black),
        Tables(number: 9, color: .red),
        Tables(number: 12, color: .red),
        Tables(number: 15, color: .black),
        Tables(number: 18, color: .red),
        Tables(number: 21, color: .red),
        Tables(number: 24, color: .black),
        Tables(number: 27, color: .red),
        Tables(number: 30, color: .red),
        Tables(number: 33, color: .black),
        Tables(number: 36, color: .red),
    ]
    @State private var table2=[
        Tables(number: 2, color: .black),
        Tables(number: 5, color: .red),
        Tables(number: 8, color: .black),
        Tables(number: 11, color: .black),
        Tables(number: 14, color: .red),
        Tables(number: 17, color: .black),
        Tables(number: 20, color: .black),
        Tables(number: 23, color: .red),
        Tables(number: 26, color: .black),
        Tables(number: 29, color: .black),
        Tables(number: 32, color: .red),
        Tables(number: 35, color: .black),
    ]
    @State private var table3=[
        Tables(number: 1, color: .red),
        Tables(number: 4, color: .black),
        Tables(number: 7, color: .red),
        Tables(number: 10, color: .black),
        Tables(number: 13, color: .black),
        Tables(number: 16, color: .red),
        Tables(number: 19, color: .red),
        Tables(number: 22, color: .black),
        Tables(number: 25, color: .red),
        Tables(number: 28, color: .black),
        Tables(number: 31, color: .black),
        Tables(number: 34, color: .red),
    ]
    @State private var amount = 1000
    @State private var Chosenumber = [ChoseNumber]()
    @State private var Chosehalf = [ChoseHalf]()
    @State private var Choseclor = [ChoseColor]()
    @State private var Choseodd = [ChoseOdd]()
    @State private var ChoseTwotoOne = [ChoseTwoToOne]()
    @State private var Chosetriple = [ChoseTriple]()
    @State private var isAnimating = false
    @State private var spinDegrees = 0.0
    @State private var rand = 0.0
    @State private var newAngle = 0.0
    @State private var index = 0
    @State private var ShowAlter = false
    @State private var alertTeat = ""
    @State private var IsClear = false
    @State var looper: AVPlayerLooper?
    @StateObject private var chips = Chips()
    let halfSector = 360.0 / 37.0 / 2.0
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.4)
                .onAppear{
                    let player = AVQueuePlayer()
                    let fileUrl = Bundle.main.url(forResource: "background", withExtension: "mp3")!
                    let item = AVPlayerItem(url: fileUrl)
                    self.looper = AVPlayerLooper(player: player, templateItem: item)
                        player.play()
                        player.volume = 0.8
                }
            ScrollView(.horizontal) {
                HStack(alignment: .bottom) {
                    VStack(alignment: .center){
                        Image("money")
                            .resizable()
                            .scaledToFit()
                        HStack{
                            Image("coin")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70,height: 70)
                            Text("\(chips.budget)")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(5)
                        .background(Color.brown)
                        .cornerRadius(20)
                        .overlay(
                                     RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 5)
                                  )
                        
                    }
                    .padding()
                    VStack(alignment: .leading){
                        HStack{
                            ForEach(table1,id: \.self){ number in
                                Number_Button(number: number,Chose: $Chosenumber,amount: $amount,IsClear: $IsClear)
                            }
                            Triple_Button(rule: "1'2to1", Chose: $Chosetriple, amount: $amount,IsClear: $IsClear)
                        }
                        
                        HStack{
                            ForEach(table2,id: \.self){ number in
                                Number_Button(number: number,Chose: $Chosenumber,amount: $amount,IsClear: $IsClear)
                            }
                            Triple_Button(rule: "2'2to1", Chose: $Chosetriple, amount: $amount,IsClear: $IsClear)
                        }
                        HStack{
                            ForEach(table3,id: \.self){ number in
                                Number_Button(number: number,Chose: $Chosenumber,amount: $amount,IsClear: $IsClear)
                            }
                            Triple_Button(rule: "3'2to1", Chose: $Chosetriple, amount: $amount,IsClear: $IsClear)
                        }
                        HStack{
                            TwoToOne_Button(rule: "1st 12",W: 225,H: 50,Chose: $ChoseTwotoOne,amount: $amount,IsClear: $IsClear)
                            TwoToOne_Button(rule: "2nd 12",W: 225,H: 50,Chose: $ChoseTwotoOne,amount: $amount,IsClear: $IsClear)
                            TwoToOne_Button(rule: "3rd 12",W: 225,H: 50,Chose: $ChoseTwotoOne,amount: $amount,IsClear: $IsClear)
                            Zero_Button(Chose: $Chosenumber, amount: $amount,IsClear: $IsClear)
                        }
                        HStack{
                            OneToNumber_Button(rule: "1 - 18",Chose: $Chosehalf,amount: $amount,IsClear: $IsClear)
                            OddEven_Button(rule: "Even",Chose: $Choseodd,amount: $amount,IsClear: $IsClear)
                            Color_Button(rule: "diamond.fill", colors: .red,Chose: $Choseclor,amount: $amount,IsClear: $IsClear)
                            Color_Button(rule: "diamond.fill", colors: .black,Chose: $Choseclor,amount: $amount,IsClear: $IsClear)
                            OddEven_Button(rule: "Odd",Chose: $Choseodd,amount: $amount,IsClear: $IsClear)
                            OneToNumber_Button(rule: "19 - 36",Chose: $Chosehalf,amount: $amount,IsClear: $IsClear)
                        }
                        HStack{
                            Spacer()
                            Text("\(amount)")
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .padding(.leading)
                                .foregroundColor(.pink)
                            HStack{
                                Chips_Button(imoney: 1000,amount: $amount)
                                Chips_Button(imoney: 5000,amount: $amount)
                                Chips_Button(imoney: 10000,amount: $amount)
                                Chips_Button(imoney: 50000,amount: $amount)
                                Chips_Button(imoney: 100000,amount: $amount)
                                Text("Total BET: \(chips.total)")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .padding(.leading)
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                        }
                    }
                    .padding(.top)
                    VStack{
                        Spacer()
                        Button {
                            IsClear=true
                            chips.budget=1000000
                            chips.total=0
                            Chosetriple.removeAll()
                            Choseodd.removeAll()
                            Choseclor.removeAll()
                            Chosenumber.removeAll()
                            Chosehalf.removeAll()
                            ChoseTwotoOne.removeAll()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                                IsClear=false
                            }
                        } label: {
                            Text("RESET")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(10)
                                .background(Color.yellow)
                                .cornerRadius(20)
                                .overlay(
                                             RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.blue, lineWidth: 5)
                                          )
                        }
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("CLEAR BETS")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(10)
                                .background(Color.yellow)
                                .cornerRadius(20)
                                .overlay(
                                             RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.blue, lineWidth: 5)
                                          )
                        }
                        Spacer()
                        Button {
                            isAnimating = true
                            rand = Double.random(in: 1...360)
                            spinDegrees += 720.0 + rand
                            newAngle = getAngle(angle: spinDegrees)
                            index = sectorFromAngles(angle: newAngle)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                                isAnimating = false
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                                alertTeat = "\(sectors[index].number)\n \(sectors[index].color)\n You Win: \(totalcount(i: index))"
                                ShowAlter=true
                            }
                        } label: {
                            Image("spin")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 120,height: 120)
                        }
                        .alert(alertTeat, isPresented: $ShowAlter, actions: {Button("OK") {
                            //chips.budget-=chips.total
                            chips.budget+=totalcount(i: index)
                        }})
                        .disabled(isAnimating == true)
                        
                    }.padding()
                    
                    RouletteView(isAnimating: $isAnimating, spinDegrees: $spinDegrees, rand: $rand, newAngle: $newAngle,index: $index)
                }
            }.environmentObject(chips)
        }
    }
    
    func getAngle(angle: Double) -> Double {
       let deg = 360 - angle.truncatingRemainder(dividingBy: 360)
       return deg
     }
    
    func totalcount(i:Int) ->Int{
        var total = 0
        for chose in Chosehalf{
            if chose.number.contains(sectors[i].number){
                total+=chose.money*2
            }
        }
        for chose in Chosenumber{
            if chose.number.contains(sectors[i].number){
                total+=chose.money*36
            }
        }
        for chose in Choseodd{
            if chose.number.contains(sectors[i].number){
                total+=chose.money*2
            }
        }
        for chose in Choseclor{
            var StrColor = ""
            if chose.color == [Color.red]{
                StrColor = "Red"
            }
            if chose.color == [Color.black]{
                StrColor = "Black"
            }
            if StrColor == sectors[i].color.rawValue{
                total+=chose.money*2
            }
        }
        for chose in Chosetriple{
            if chose.number.contains(sectors[i].number){
                total+=chose.money*3
            }
        }
        for chose in ChoseTwotoOne{
            if chose.number.contains(sectors[i].number){
                total+=chose.money*3
            }
        }
        return total
    }
    func sectorFromAngles(angle: Double) -> Int {
        var i = 0
        var sector: Sector = Sector(number: -1, color: .empty)
            
        while sector == Sector(number: -1, color: .empty) && i < sectors.count {
            let start: Double = halfSector * Double((i*2 + 1)) - halfSector
            let end: Double = halfSector * Double((i*2 + 3))
                
            if(angle >= start && angle < end) {
                sector = sectors[i]
            }
            i+=1
        }
        return i-1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
