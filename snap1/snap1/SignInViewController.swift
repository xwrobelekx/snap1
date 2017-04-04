//
//  SignInViewController.swift
//  snap1
//
//  Created by Kamil Wrobel on 3/30/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

  
    @IBAction func turnUpTapped(_ sender: Any) {
        
    FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
        print("we tried to sign in")
        if error != nil {
            print("We have an error: \(error)")
            
            FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                print("we tried to create user ")
                if error != nil {
                    print("we have an error: \(error)")
                } else {
                    print("created user sucesfully")
                    
                  FIRDatabase.database().reference().child("users").child(user!.uid).child("emial").setValue(user!.email)
                    
                    
                    
                    self.performSegue(withIdentifier: "signinsegue", sender: nil)
                    
                    
                }
            })
            
            
        } else {
            print("Signed in Succesfully!")
            self.performSegue(withIdentifier: "signinsegue", sender: nil)
        }
    })
        
    }


}

