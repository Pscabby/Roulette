//
//  Setting number.swift
//  Roulette
//
//  Created by Abby on 2023/3/1.
//

import Foundation
import SwiftUI

enum Colors: String{
    case red = "Red"
    case black = "Black"
    case green = "Zero"
    case empty
}

struct Sector:Equatable{
    let number:Int
    let color:Colors
}

struct Tables:Hashable{
    let number:Int
    let color:Color
}
