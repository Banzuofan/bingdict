//
//  DictionaryWordModels.swift
//  BINGDict
//
//  Created by YXLONG on 2017/5/26.
//  Copyright © 2017年 MST. All rights reserved.
//

import Foundation
import HandyJSON

class BIBaseModel: HandyJSON {
    required init() {}
}

class BIWordDef: BIBaseModel {
    var _type: String?
    var instrumentation: BIWordInstrumentation?
    var value: [BIWordValue]?
}

class BIWordInstrumentation: BIBaseModel {
    var pingUrlBase: String?
    var pageLoadPingUrl: String?
}

class BIWordValue: BIBaseModel {
    var name: String?
    var bingId: String?
    var pronunciation: String?
    var pronunciationAudio: BIPronunciationAudio?
    var meaningGroups: [BIMeaningGroups]?
}

class BIPronunciationAudio: BIBaseModel {
    var contentUrl: String?
}

class BIMeaningGroups: BIBaseModel {
    var meanings: [BIMeanings]?
    var partsOfSpeech: [BIPartsOfSpeech]?
}

class BIMeanings: BIBaseModel {
    var richDefinitions: [BIRichDefinitions]?
    var synonyms: [BINameTag]?
    var antonyms: [BINameTag]?
}

class BIRichDefinitions: BIBaseModel {
    var fragments: [BIFragments]?
    var examples: [String]?
    var subDefinitions: [BISubDefinitions]?
}

class BISubDefinitions: BIBaseModel {
    var fragments: [BIFragments]?
    var domains: [String]?
}

class BIFragments: BIBaseModel {
    var text: String?
}

class BINameTag: BIBaseModel {
    var name: String?
}

class BIPartsOfSpeech: BIBaseModel{
    var name: String?
    var description: String?
}
