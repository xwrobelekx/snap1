//
//  SnapsViewController.swift
//  snap1
//
//  Created by Kamil Wrobel on 3/31/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class SnapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView5: UITableView!
    
    var snaps: [Snap] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView5.dataSource = self
        tableView5.delegate = self

        //observe is a way to pull the data from firebase
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childAdded, with: {(FIRDataSnapshot) in
            print(FIRDataSnapshot)
 
            let snap = Snap()
            
            snap.from = (FIRDataSnapshot.value as! NSDictionary)["from"] as! String
            snap.descrip2 = (FIRDataSnapshot.value as! NSDictionary)["description"] as! String
            snap.imageURL = (FIRDataSnapshot.value as! NSDictionary)["imageURL"] as! String
            
            
            self.snaps.append(snap)
            
           self.tableView5.reloadData()
            
     
            
        })

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snaps.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        let snap = snaps[indexPath.row]
        
        cell.textLabel?.text = snap.from
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let snap = snaps[indexPath.row]
        
        performSegue(withIdentifier: "viewSnapSegue", sender: snap)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "viewSnapSegue" {
        let nextVC = segue.destination as! ViewSnapViewController
        nextVC.snap3 = sender as! Snap
    }
    }
    
    @IBAction func logoutTapped3(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("logged Out")
        
        // this dismisses the segue, and brings you back to to login screen when logout is pressed.
        
    }
   



}
