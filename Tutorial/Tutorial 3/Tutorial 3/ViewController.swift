//
//  ViewController.swift
//  Tutorial 3
//
//  Created by Vanessa Barnard on 10/7/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as UIViewController
            if segue.identifier == "redSegue" {
                destinationVC.title = "Red"
                destinationVC.view.backgroundColor = UIColor.red
            } else if segue.identifier == "blueSegue" {
                destinationVC.title = "Blue"
                destinationVC.view.backgroundColor = UIColor.blue
            }
        }


}

