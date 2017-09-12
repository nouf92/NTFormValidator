//
//  NTTextField.swift
//  Pods
//
//  Created by Nouf Alturaief on 9/11/17.
//
//

import UIKit

class NTTextField: UITextField {
    
    func hasValidEmail() -> Bool {
        
        /*
         Start with one or more character
         then '@'
         then one or more character
         then a dot
         then two or more letters
         */
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self.text!)
        
        return result
    }
    
}
