//
//  ViewController.swift
//  tutorial0_Barnard_Vanessa
//
//  Created by Vanessa Barnard on 9/10/20.
//  Copyright © 2020 Vanessa Barnard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isBlue = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var button: UIButton!
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        isBlue = !isBlue
        if isBlue {
            button.setTitle("Turn Red", for: .normal)
            label.text = "Blue"
            label.textColor = UIColor.blue
        } else {
            button.setTitle("Turn Blue", for: .normal)
            label.text = "Red"
            label.textColor = UIColor.red
        }
    }
    
    @IBOutlet weak var label: UILabel!
}

