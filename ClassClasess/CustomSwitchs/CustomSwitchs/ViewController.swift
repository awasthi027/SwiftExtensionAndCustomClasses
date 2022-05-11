//
//  ViewController.swift
//  CustomeControlsPoc
//
//  Created by Tanuja Awasthi on 10/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ffSwitch: CustomSwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didChangeSwitchState(_ sender: AnyObject) {
        debugPrint("didChangeSwitchState: \(ffSwitch.isOn)")
    }
    
}

