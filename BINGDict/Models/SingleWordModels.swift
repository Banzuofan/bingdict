//
//  SingleWordModels.swift
//  BINGDict
//
//  Created by YXLONG on 2017/5/19.
//  Copyright © 2017年 MST. All rights reserved.
//

import Foundation
import HandyJSON

struct SWPron: HandyJSON{
    var US: String?
    var UK: String?
}

class SWValue: HandyJSON {
    var sig: String?
    var def: Dictionary<String, Any>?
    var pron: SWPron?
    
    func defCount() -> Int {
        if let _def = def{
            return _def.keys.count
        }
        return 0
    }
    
    required init() {}
}

class SingleWord: HandyJSON {
    var Key: String?
    var Value: SWValue = SWValue()
    
    required init() {}
}

class SingleWordDef: HandyJSON {
    var word: SingleWord = SingleWord()
    
    required init() {}
}
