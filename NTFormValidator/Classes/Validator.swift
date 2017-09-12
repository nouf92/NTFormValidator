//
//  Validator.swift
//  Pods
//
//  Created by Nouf Alturaief on 9/12/17.
//
//

import Foundation

public enum ValidationType {
    case email, containNumber, containLetter, containCapitalLetter, containSmallLetter, containSpecialChar, containChar, containUniCodeLetter, containUniCodeNumber, containUniCodeChar
    case numbersOnly, lettersOnly, smallLettersOnly, capitalLettersOnly, UniCodeLettersOnly, ArabicLettersOnly
    case minLength(Int), maxLength(Int)
}

public class Validator: NSObject {
    
    private var type: ValidationType!
    private var regex: String!
    
    public init(type: ValidationType) {
        
        switch type {
        case .email:
            regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            break
        case .containNumber:
            regex = ".*\\d.*"
            break
        case .containLetter:
            regex = ".*\\[a-zA-Z].*"
            break
        case .containSmallLetter:
            regex = ".*\\[a-z].*"
            break
        case .containCapitalLetter:
            regex = ".*\\[A-Z].*"
            break
        case .minLength(let len):
            print(len)
            break
        default:
           regex = nil
        }
    }
    
    internal func isValid(text: String) -> Bool {
        
        guard regex != nil else {
            return false
        }
        
        let test = NSPredicate(format:"SELF MATCHES %@", self.regex)
        let result = test.evaluate(with: text)
        
        return result
    }
}
