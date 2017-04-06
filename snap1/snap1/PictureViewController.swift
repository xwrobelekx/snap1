//
//  PictureViewController.swift
//  snap1
//
//  Created by Kamil Wrobel on 4/1/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    var uuid = NSUUID().uuidString
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        
        nextButtonOutlet.isEnabled = false
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        
        imageView.backgroundColor = UIColor.clear
        
        nextButtonOutlet.isEnabled = true
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    
    

    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        
        imagePicker.allowsEditing = false
        
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }

    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        nextButtonOutlet.isEnabled = false
        
        
        let imagesFolder = FIRStorage.storage().reference().child("images")
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)
        
        
        // this NSUUID() created a unike number each time we upload a picture to fire base
        
        
        imagesFolder.child("\(uuid).jpeg)").put(imageData!, metadata: nil, completion:{(metadata, error) in
            
            print("we tried to upload")
            
            if error != nil {
                print("we have an error: \(error)")
            } else {
                
               print(metadata?.downloadURL()! as Any)
                // this downloadns and prints the url of the image
                
                  self.performSegue(withIdentifier: "selectUserSegue" , sender: metadata?.downloadURL()!.absoluteString)
            }
            
        })
        
        
        
        
      
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! SelectUserViewController
        nextVC.imageURL = sender as! String
        nextVC.descrip = descriptionTextField.text!
        nextVC.uuid = uuid
    }
    

    
}
