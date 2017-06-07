//
//  WordDefinitionModel.swift
//  BINGDict
//
//  Created by YXLONG on 2017/5/25.
//  Copyright © 2017年 MST. All rights reserved.
//

import Foundation
import HandyJSON

class FullWordDef: HandyJSON {
    
    var LEX: FWLex?
    
//    var MT = ？
//    
//    var SENT = ？
//    
//    var SUGG = ？
    
    required init() {}
}

///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////

/// Nodes under LEX
class FWLex: HandyJSON {
    
    var C_DEF: [FWDef]?
    var H_DEF: [FWDef]?
    var HW: FWhw?
    var INF: [FWinf]?
    var LCS: [FWlcs]?
    var PHRASE: [FWPhrase]?
    var PRON: [FWpron]?
    var THES: [FWthes]?
    
    required init() {}
}

/// LEX->[C_DEF]
class FWDef: HandyJSON {
    
    var DEF: String?
    var POS: String?
    var SEN: [FWDefSen]?
    
    required init() {}
}

/// LEX->[C_DEF]->SEN
class FWDefSen: HandyJSON {
    var D: String?
    var R: Int?
    var URL: String?
    var STR: Any?
    required init() {}
}

class FWhw: HandyJSON {
    var DEF: String?
    var SIG: String?
    var V: String?
    
    required init() {}
}

class FWinf: HandyJSON {
    
    var IE: String?
    var T: String?
    
    required init() {}
}

class FWTestInf: HandyJSON {
    var INF: [FWinf]?
    required init() {}
}

class FWlcs: HandyJSON {
    
    var LC: FWlc?
    var RELA: String?
    
    required init() {}
}

class FWlc: HandyJSON {
    
    var T1: String?
    var T2: String?
    
    required init() {}
}

class FWPhrase: HandyJSON {
    
    var DEF: String?
    var SIG: String?
    var V: String?
    
    required init() {}
}

class FWpron: HandyJSON {
    
    var L: String?
    var V: String?
    
    required init() {}
}

class FWthes: HandyJSON {
    
    var A: [String]?
    var S: [String]?
    var POS: String?
    required init() {}
}

///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////

