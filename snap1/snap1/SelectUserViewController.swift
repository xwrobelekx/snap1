//
//  SelectUserViewController.swift
//  snap1
//
//  Created by Kamil Wrobel on 4/4/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView1: UITableView!
    
    var users3 : [User] = []
    
    var imageURL = ""
    var descrip = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.tableView1.dataSource = self
        self.tableView1.delegate = self
        
            //observe is a way to pull the data from firebase
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(FIRDataSnapshot) in
            print(FIRDataSnapshot)
            
            let user = User()
            
            user.email = (FIRDataSnapshot.value as! NSDictionary)["email"] as! String
            
            
            user.uid = FIRDataSnapshot.key
            
            self.users3.append(user)
            
            self.tableView1.reloadData()
            
            
 
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users3.count
    }
 

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let user = users3[indexPath.row]
        
        cell.textLabel?.text = user.email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = users3[indexPath.row]
        
        let snap = ["from" : user.email, "description" : descrip, "imageURL" : imageURL]
        
        FIRDatabase.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
