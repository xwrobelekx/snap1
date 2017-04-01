//
//  SnapsViewController.swift
//  snap1
//
//  Created by Kamil Wrobel on 3/31/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    
    @IBAction func logoutTapped3(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("logged Out")
        
        // this dismisses the segue, and brings you back to to login screen when logout is pressed.
        
    }
   



}
