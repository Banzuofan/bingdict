//
//  BINetworkConstants.swift
//  BINGDict
//
//  Created by YXLONG on 2017/5/25.
//  Copyright © 2017年 MST. All rights reserved.
//

import Foundation

let baseURLDefault = "https://dict.bing.com.cn/api/http/v2"
let baseURLDictV6 = "https://www.bing.com/api/v6"
let baseURLChinacloudsites = "http://wordembedding.chinacloudsites.cn/api"


public enum BIBaseURL {
    case defaultURL
    case dictV6URL
    case chinacloudsitesURL
    case custom(String)
    
    public init(_ url: String){
        self = .custom(url)
    }
}


extension BIBaseURL: RawRepresentable {
    
    public init?(rawValue: String){
        self = .custom(rawValue)
    }
    
    public var rawValue: String {
        switch self {
        case .defaultURL: return baseURLDefault
        case .dictV6URL: return baseURLDictV6
        case .chinacloudsitesURL: return baseURLChinacloudsites
        case .custom(let url): return url
        }
    }
}


enum BITLanMode: String {
    case EN_ZH = "en-us/zh-cn"
    case ZH_EN = "zh-cn/en-us"
}


enum BIResponseFormat: String {
    case xml = "xml"
    case json = "json"
}
