//
//  ChoseArray_Model.swift
//  Roulette
//
//  Created by Abby on 2023/3/7.
//

import Foundation
import SwiftUI
struct ChoseNumber:Hashable{
    var number:Array<Int>
    var money:Int
}

//1-18 10-36
struct ChoseHalf:Hashable{
    var number:Array<Int>
    var money:Int
}

//Red Black
struct ChoseColor:Hashable{
    var color:Array<Color>
    var money:Int
}

//Odd Even
struct ChoseOdd:Hashable{
    var number:Array<Int>
    var money:Int
}

//1st 12 2st 12 3st 12
struct ChoseTwoToOne:Hashable{
    var number:Array<Int>
    var money:Int
}

//3's two to one
struct ChoseTriple:Hashable{
    var number:Array<Int>
    var money:Int
}
