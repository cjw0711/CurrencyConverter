//
//  CurrencyLogic.swift
//  CurrencyConverter
//
//  Created by user232949 on 2/17/23.
//

import Foundation

struct CurrencyLogic {
    var usd : Int = 0
    var euroBool : Bool = true
    var yenBool : Bool = true
    var wonBool : Bool = true
    var yuanBool : Bool = true
    
    mutating func setEuro(_ switchValue : Bool) {
        euroBool = switchValue
    }
    
    mutating func setYen(_ switchValue : Bool) {
        yenBool = switchValue
    }
    
    mutating func setWon(_ switchValue : Bool) {
        wonBool = switchValue
    }
    
    mutating func setYuan(_ switchValue : Bool) {
        yuanBool = switchValue
    }
    
    mutating func setUSD(_ input : Int) {
        usd = input
    }
    
    mutating func getEuroValue() -> Double {
        return Double(usd) * 0.93
    }
    
    mutating func getYuanValue() -> Double {
        return Double(usd) * 6.87
    }
    
    mutating func getYenValue() -> Double {
        return Double(usd) * 134.10
    }
    
    mutating func getWonValue() -> Double {
        return Double(usd) * 1295.90
    }
    
    mutating func converter() -> Dictionary<String, Double> {
        let convert = [ "usd" : Double(usd),
                          "euro": euroBool ? getEuroValue() : -1.0,
                          "won": wonBool ? getWonValue() : -1.0,
                          "yen": yenBool ? getYenValue() : -1.0,
                          "yuan": yuanBool ? getYuanValue() : -1.0
        ]
        return convert
    }

}
