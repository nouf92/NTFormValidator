//
//  NTTextField.swift
//  Pods
//
//  Created by Nouf Alturaief on 9/11/17.
//
//

import UIKit

public class NTTextField: UITextField {
    
    private var validators = [Validator]()
    
    public func addValidators(types: [ValidationType]) {
        
        for type in types {
            let validator = Validator(type: type)
            self.validators.append(validator)
        }
    }
    
    public func validateInput() -> Bool {
        
        for validator in validators {
            if !validator.isValid(text: self.text!) {
                return false
            }
        }
        
        return true
    }
}
