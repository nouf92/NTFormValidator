//
//  ViewController.swift
//  NTFormValidator
//
//  Created by indieNouf on 09/11/2017.
//  Copyright (c) 2017 indieNouf. All rights reserved.
//

import UIKit
import NTFormValidator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Testing
        let textField = NTTextField()
        textField.text = ""
        textField.addValidators(types: [.minLength(3), .maxLength(30), .e164Phone])
        //textField.addValidator(type: .containNumbers)
        
        if textField.validateInput() {
            print("true")
        } else {
            print("false")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

