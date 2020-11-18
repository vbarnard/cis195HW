//
//  CTVC.swift
//  app4-Vanessa-Barnard
//
//  Created by Vanessa Barnard on 10/22/20.
//

import UIKit

protocol AddContactDelegate: class {
    func didCreate(_ contact: Contact)
}

class ACVC: UIViewController {
    
    weak var delegate: AddContactDelegate?
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        let newContact = createNewContact()
        if (newContact != nil) {
            self.delegate?.didCreate(newContact!)
        }
        
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func createNewContact() -> Contact? {
        if (!text1.hasText || !text2.hasText || !text3.hasText || !text4.hasText || !text5.hasText || !isNumeric(string: text5.text!)) {
            return nil
        } //else {
           // return nil
            //Contact(description : "", designation : "", name : "", image : "")
        //}
        return nil
    }
    
    func isNumeric(string: String) -> Bool
    {
        let number = Int(string)
        return number != nil
    }
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text4: UITextField!
    @IBOutlet weak var text5: UITextField!
    
    
}
