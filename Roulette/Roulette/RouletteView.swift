//
//  RouletteView.swift
//  Roulette
//
//  Created by Abby on 2023/3/8.
//

import SwiftUI

struct RouletteView: View {
    @Binding  var isAnimating:Bool
    @Binding  var spinDegrees:Double
    @Binding  var rand:Double
    @Binding  var newAngle:Double
    let halfSector = 360.0 / 37.0 / 2.0
    var spinAnimation: Animation {
        Animation.easeOut(duration: 3.0)
          .repeatCount(1, autoreverses: false)
    }
    @Binding var index:Int
    var body: some View {
        VStack {
            Text(self.isAnimating ? "Spining\n..." : "Sector\n\(sectors[sectorFromAngles(angle: newAngle)].number) \(sectors[sectorFromAngles(angle: newAngle)].color.rawValue)")
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(sectors[sectorFromAngles(angle: newAngle)].color.rawValue == "Red" ? .red : .black)
                Image("arrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
                Image("wheel")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: spinDegrees))
                    .frame(width: 245, height: 245, alignment: .center)
                    .animation(spinAnimation)
            }
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
    
    func sectorFromAngle(angle: Double) -> String {
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
        return "Sector\n\(sector.number) \(sector.color.rawValue)"
    }
}

//struct RouletteView_Previews: PreviewProvider {
//    static var previews: some View {
//        RouletteView()
//    }
//}
