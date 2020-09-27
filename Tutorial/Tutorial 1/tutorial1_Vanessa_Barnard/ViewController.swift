//
//  ViewController.swift
//  tutorial1_Vanessa_Barnard
//
//  Created by Vanessa Barnard on 9/17/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad()")
    }
    
    override func viewDidAppear(_: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear()")
    }
    
    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear()")
    }
    
    override func viewDidDisappear(_: Bool) {
        super.viewDidDisappear(true)
        print("viewDidDisappear()")
    }
    
    override func viewWillDisappear(_: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear()")
    }


}

