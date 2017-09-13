//
//  Validator.swift
//  Pods
//
//  Created by Nouf Alturaief on 9/12/17.
//
//

import Foundation

public enum ValidationType {
    case email, e164Phone, saudiPhone, containNumber, containLetter, containCapitalLetter, containSmallLetter, containSpecialChar, containArabicLetter, containArabicNumber
    case numbersOnly, lettersOnly, smallLettersOnly, capitalLettersOnly, ArabicLettersOnly, ArabicNumbersOnly
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
        case .e164Phone:
            regex = "^\\+?[1-9]\\d{1,14}$"
            break
        case .saudiPhone:
            regex = "^0[15]{1}[0-9]{8}"
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
        case .containSpecialChar:
            regex = ".*[^A-Za-z0-9].*"
            break
        case .containArabicLetter:
            regex = ".*[\\u0621-\\u064A].*"
            break
        case .containArabicNumber:
            regex = ".*[\\u0660-\\u0669].*"
            break
        case .numbersOnly:
            regex = "^[0-9]*$"
            break
        case .lettersOnly:
            regex = "^[a-zA-Z]*$"
            break
        case .smallLettersOnly:
            regex = "^[a-z]*$"
            break
        case .capitalLettersOnly:
            regex = "^[A-Z]*$"
            break
        case .ArabicLettersOnly:
            regex = "^[\\u0621-\\u064A]*$"
            break
        case .ArabicNumbersOnly:
            regex = "^[\\u0660-\\u0669]*$"
            break
        case .minLength(let len):
            regex = "^.{\(len),}$"
            break
        case .maxLength(let len):
            regex = "^.{0,\(len)}$"
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
