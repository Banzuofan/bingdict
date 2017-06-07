//
//  BINetworkManager.swift
//  BINGDict
//
//  Created by YXLONG on 2017/5/19.
//  Copyright © 2017年 MST. All rights reserved.
//

import Foundation

class BINetworkManager {
    
    /// 查询简单释义
    class func lookupLite(_ word: String?, completion: @escaping(SingleWordDef?, Error?) -> Void){
        
        guard word?.isEmpty == false else{
            return
        }
        
        let params = ["query" : word!,
                      "ZUMO-API-VERSION" : "2.0.0",
                      "src" : "ios"]
        let request = BIRequest(path: "singleworddict",
                                paramters: params,
                                url: .chinacloudsitesURL)
        request.responseString(success: { result in
            
            if let wd = SingleWordDef.deserialize(from: result) {
                completion(wd, nil)
            }
            
        }) { error in
            print(error)
            completion(nil, error)
        }
    }
    
    /// 查询完整单词释义
    class func lookup(_ word: String?, tLanMode:BITLanMode, completion: @escaping(BIWordDef?, Error?) -> Void){
        guard word?.isEmpty == false else{
            return
        }
        
        let path = "dictionarywords/search"
        
        let params = ["q":word!,
                      "appid":AppId,
                      "mkt":Market,
                      "pname":Pname]
        
        let request = BIRequest(path: path,
                                paramters: params,
                                url: .dictV6URL,
                                format: .json)
        
        request.responseString(success: { (result) in

            if let wd = BIWordDef.deserialize(from: result) {
                completion(wd, nil)
            }
        }) { (error) in
            print(error)
            completion(nil, error)
        }
    }
}
