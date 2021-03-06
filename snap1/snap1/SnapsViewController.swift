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
            snap.key = FIRDataSnapshot.key
             snap.uuid = (FIRDataSnapshot.value as! NSDictionary)["uuid"] as! String
            
            self.snaps.append(snap)
            
           self.tableView5.reloadData()
            
     
            
        })

        // this removes snaps, i mean the removes the "snap" from table view, the snap gets deleted from fire base in view snap VC
        
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childRemoved, with: {(FIRDataSnapshot) in
            print(FIRDataSnapshot)
            
   
            var index = 0
            
            for snap in self.snaps {
                if snap.key == FIRDataSnapshot.key {
                    self.snaps.remove(at: index)
                }
                
                index += 1
            }
            
            self.tableView5.reloadData()
        })
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if snaps.count == 0 {
            return 1
        } else {
        
        return snaps.count
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if snaps.count == 0 {
            
            cell.textLabel?.text = "You have no snaps 👻 "
            cell.textLabel?.textAlignment = .center
        
            
            
            
        } else {
        
        let snap = snaps[indexPath.row]
        
        cell.textLabel?.text = snap.from
        }
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
