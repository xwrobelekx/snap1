//
//  ViewSnapViewController.swift
//  snap1
//
//  Created by Kamil Wrobel on 4/5/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseDatabase
import Firebase
import FirebaseAuth
import FirebaseStorage

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView4: UIImageView!
    
    
    @IBOutlet weak var textLabel4: UILabel!
    
    var snap3 = Snap()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        textLabel4.text = snap3.descrip2
        
        
        imageView4.sd_setImage(with: URL(string: snap3.imageURL))
        
    }

    override func viewWillDisappear(_ animated: Bool) {
            FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap3.key).removeValue()
        
        FIRStorage.storage().reference().child("images").child("\(snap3.uuid).jpeg)").delete { (error) in
            print("we deleted the pic.")
        }
        
        
    }

 

}
