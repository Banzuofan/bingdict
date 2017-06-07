//
//  BIRequest.swift
//  BINGDict
//
//  Created by YXLONG on 2017/5/22.
//  Copyright © 2017年 MST. All rights reserved.
//

import Foundation
import Alamofire

class BIRequest{
    
    let httpMethod: HTTPMethod
    let baseUrl: BIBaseURL
    let format: BIResponseFormat
    
    var request: DataRequest?
    var paramters: [String:Any]?
    var fullUrl: String?
    
    init(path:String,
         paramters: [String:Any]?,
         url:BIBaseURL = .defaultURL,
         httpMethod:HTTPMethod = .get,
         format:BIResponseFormat = .json) {
        
        self.httpMethod = httpMethod
        self.baseUrl = url
        self.paramters = paramters
        self.format = format
        
        if paramters != nil {
            self.paramters?["format"] = format.rawValue 
        }
        else{
            self.paramters = ["format" : format.rawValue]
        }
        
        fullUrl = genFullUrl(url: self.baseUrl.rawValue, path: path)
    }
    
    
    func genFullUrl(url: String, path: String) -> String? {
        
        if path.isEmpty {
            return url
        }
        
        var result: String?
        
        let startIndex: String.Index = path.startIndex
        
        let endIndex = path.index(after: startIndex)
        let slice = path.substring(to: endIndex)
            
        if slice == "/" {
            result = url.appending(path)
        }
        else{
            result = url.appending("/").appending(path)
        }
        
        return result
    }
    
    func responseString(success: @escaping(String) -> Swift.Void, failure: @escaping(Error) -> Swift.Void) {
        guard !(fullUrl?.isEmpty)! else {
            return
        }
        
        let request = Alamofire.request(fullUrl!,
                                        method: self.httpMethod,
                                        parameters: self.paramters,
                                        encoding: URLEncoding.default,
                                        headers: nil)
        
        request.responseString(encoding: .utf8) { (response) in
            if response.result.isSuccess {
                
                print(response.result.value ?? "")
                
                let requestUrl = response.request?.url!.absoluteString
                let statusCode = response.response?.statusCode
                
                print("\n----bedin----")
                print("RequestUrl: \(requestUrl!)" + "\nresult \(statusCode?.description ?? ""):\n" + "\(response.result.value.toJSONValue() ?? "")")
                print("----end----\n")
                
                success(response.result.value ?? "")
            }
            else{
                failure(response.error!)
            }
        }
    }
}
