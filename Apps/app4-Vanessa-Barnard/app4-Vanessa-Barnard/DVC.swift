//
//  CTVC.swift
//  app4-Vanessa-Barnard
//
//  Created by Vanessa Barnard on 10/22/20.
//

import UIKit

class DVC: UIViewController {
    
    var firstName = "First Name"
    var lastName = "Last Name"
    var company = "Company"
    var email = "Email"
    var phoneNumber = 0000000000
    var image : UIImage?
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var companyUnique: UILabel!
    @IBOutlet weak var emailFixed: UILabel!
    @IBOutlet weak var emailUnique: UILabel!
    @IBOutlet weak var phoneFixed: UILabel!
    @IBOutlet weak var phoneUnique: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var companyFixed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.text = self.firstName + " " +  self.lastName
        companyUnique.text = self.company
        companyFixed.text = "Company"
        emailFixed.text = "Email"
        phoneFixed.text = "Phone"
        emailUnique.text = self.email
        phoneUnique.text = String(self.phoneNumber)
        img.layer.cornerRadius = img.frame.size.height / 2;
        img.layer.masksToBounds = true;
        img.layer.borderWidth = 0;
        
    }
    
}
