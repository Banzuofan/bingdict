//
//  ViewController.swift
//  BINGDict
//
//  Created by YXLONG on 2017/5/19.
//  Copyright © 2017年 MST. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class BIHomePageViewController: UIViewController {

    fileprivate var _startBtn: UIButton?
    fileprivate var _parserWithHandyJBtn: UIButton?
    
    fileprivate var _searchBtn: UIButton?
    fileprivate var _searchBtnBgView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        
        _searchBtnBgView = UIView(frame: CGRect.zero)
        _searchBtnBgView?.backgroundColor = UIColor.themeColor
        self.view.addSubview(_searchBtnBgView!)
        _searchBtnBgView?.translatesAutoresizingMaskIntoConstraints = false
        
        _searchBtn = UIButton(type: .custom)
        _searchBtn?.setTitle(String.commonPlaceholder, for: .normal)
        _searchBtn?.setTitleColor(UIColor.searchBoxPlaceholder, for: .normal)
        _searchBtn?.backgroundColor = UIColor.white
        _searchBtn?.addTarget(self, action: #selector(executeSearch(_:)), for: .touchUpInside)
        self.view.addSubview(_searchBtn!)
        _searchBtn?.layer.borderWidth = 0.6
        _searchBtn?.layer.borderColor = UIColor.lightGray.cgColor
        _searchBtn?.translatesAutoresizingMaskIntoConstraints = false
        
        
        let viewGuide = self.view.layoutMarginsGuide
        
        let leftC = _searchBtn?.leftAnchor.constraint(equalTo: viewGuide.leftAnchor)
        let rightC = _searchBtn?.rightAnchor.constraint(equalTo: viewGuide.rightAnchor)
        let topC = _searchBtn?.topAnchor.constraint(equalTo: viewGuide.topAnchor, constant: 35)
        let heightC = _searchBtn?.heightAnchor.constraint(equalToConstant: 45)
        self.view.addConstraints([leftC!, rightC!, topC!, heightC!])
        
        
        let _searchBtnBgView_left = _searchBtnBgView?.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)
        let _searchBtnBgView_right = _searchBtnBgView?.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)
        let _searchBtnBgView_top = _searchBtnBgView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0)
        let _searchBtnBgView_bottom = _searchBtnBgView?.bottomAnchor.constraint(equalTo: _searchBtn!.bottomAnchor, constant: 15)
        self.view.addConstraints([_searchBtnBgView_left!, _searchBtnBgView_right!, _searchBtnBgView_top!, _searchBtnBgView_bottom!])
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func executeSearch(_ sender: AnyObject) {
        
        let vc = BISearchViewController()
        self.present(vc, animated: false) {
            
        }
        
        
//        let btn = sender as! UIButton
//        let btnTag = btn.tag
//        
//        if btnTag==101 {
//            
//            BINetworkManager.lookupLite("completion", completion: { (wordDef, error) in
//                if error != nil {
//                    print(error!)
//                }
//                else{
//                    print(wordDef.toJSONValue()!)
//                }
//            })
//        }
//        else{
//            
//            BINetworkManager.lookup("make", tLanMode: .EN_ZH) { (wordDef, error) in
//                if error != nil {
//                    print(error)
//                }
//                else{
//                    print(wordDef.toJSONValue()!)
//                }
//            }
//        }
        
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

