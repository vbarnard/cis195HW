//
//  DVC.swift
//  NationalParks
//
//  Created by Vanessa Barnard on 11/12/20.
//

import Foundation

import UIKit


class DVC: UIViewController {
    
    var myDescription : String!
    var myDesignation : String!
    var fullName : String!
    var images : [Image]!

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var text: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dump(self)
        
        if self.images.count != 0 {
            let imageUrlString = self.images[0].url
            
            guard let imageUrl:URL = URL(string: imageUrlString) else {return}
            img.loadImge(withUrl: imageUrl)
        }
        
        designation.text = self.myDesignation
        name.text = self.fullName
        text.text = self.myDescription
    }
    
}

