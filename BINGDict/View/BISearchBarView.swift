//
//  BISearchBarView.swift
//  BINGDict
//
//  Created by YXLONG on 2017/6/7.
//  Copyright © 2017年 MST. All rights reserved.
//

import Foundation
import UIKit


protocol BISearchBarViewDelegate {
    
    func searchDidCancel()
    func searchDidExecute(_ query: String)
}


class BISearchBarView: UIView {
    
    var delegate: BISearchBarViewDelegate?
    
    fileprivate var textField: UITextField?
    fileprivate var cancelBtn: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.searchBarBgColor
        
        textField = UITextField(frame: CGRect.zero)
        textField?.backgroundColor = UIColor.white
        let aStr = NSAttributedString(string: String.commonPlaceholder, attributes: [NSForegroundColorAttributeName : UIColor.searchBoxPlaceholder])
        textField?.attributedPlaceholder = aStr
        textField?.textColor = UIColor.black
        textField?.font = UIFont.systemFont(ofSize: 16)
        textField?.delegate = self
        textField?.returnKeyType = .search
        self.addSubview(textField!)
        textField?.layer.cornerRadius = 2
        
        textField?.translatesAutoresizingMaskIntoConstraints = false
        
        let textField_leftC = textField?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15)
        let textField_topC = textField?.topAnchor.constraint(equalTo: self.topAnchor, constant: 40)
        let textField_rightC = textField?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -75)
        let textField_heightV = textField?.heightAnchor.constraint(equalToConstant: 40)
        self.addConstraints([textField_leftC!,
                             textField_topC!,
                             textField_rightC!,
                             textField_heightV!])
        
        
        cancelBtn = UIButton(type: .custom)
        cancelBtn?.setTitle("Cancel", for: .normal)
        cancelBtn?.setTitleColor(UIColor.themeColor, for: .normal)
        self.addSubview(cancelBtn!)
        cancelBtn?.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        cancelBtn?.translatesAutoresizingMaskIntoConstraints = false
        
        let cancelBtn_leftC = cancelBtn?.leftAnchor.constraint(equalTo: textField!.rightAnchor, constant: 8)
        let cancelBtn_rightC = cancelBtn?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)
        let cancelBtn_heightC = cancelBtn?.heightAnchor.constraint(equalToConstant: 40)
        let cancelBtn_centerY = cancelBtn?.centerYAnchor.constraint(equalTo: textField!.centerYAnchor)
        self.addConstraints([cancelBtn_leftC!,
                             cancelBtn_rightC!,
                             cancelBtn_heightC!,
                             cancelBtn_centerY!])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func cancelAction() {
        delegate?.searchDidCancel()
    }
    
}

extension BISearchBarView: UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        delegate?.searchDidExecute(textField.text!)
        return true
    }
}
