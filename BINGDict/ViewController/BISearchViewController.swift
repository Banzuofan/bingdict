//
//  BISearchViewController.swift
//  BINGDict
//
//  Created by YXLONG on 2017/6/7.
//  Copyright © 2017年 MST. All rights reserved.
//

import Foundation
import UIKit


class BISearchViewController: UIViewController {
    
    fileprivate var searchBarView: BISearchBarView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        
        
        searchBarView = BISearchBarView(frame: CGRect.zero)
        searchBarView?.delegate = self
        self.view.addSubview(searchBarView!)
        searchBarView?.translatesAutoresizingMaskIntoConstraints = false
        
        let searchBarView_leftC = searchBarView?.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let searchBarView_rightC = searchBarView?.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let searchBarView_topC = searchBarView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0)
        let searchBarView_heightV = searchBarView?.heightAnchor.constraint(equalToConstant: 95)
        self.view.addConstraints([searchBarView_leftC!,
                                  searchBarView_rightC!,
                                  searchBarView_topC!,
                                  searchBarView_heightV!])
        
        
    }
}

extension BISearchViewController: BISearchBarViewDelegate{
    
    func searchDidCancel(){
        self.dismiss(animated: false, completion: nil)
    }
    
    func searchDidExecute(_ query: String){
        
        guard !query.isEmpty else {
            return
        }
        
        BINetworkManager.lookup(query, tLanMode: .EN_ZH) { (wordDef, error) in
            
            if error != nil {
                print(error)
            }
            else{
                print(wordDef.toJSONValue()!)
            }
        }

    }
}
