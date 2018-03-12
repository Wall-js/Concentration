//
//  Card.swift
//  Concentration
//
//  Created by ckd－macpro on 2018/3/9.
//  Copyright © 2018年 ckd－macpro. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    //静态变量
    static var identifierFactory = 0
    
    //类方法
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
