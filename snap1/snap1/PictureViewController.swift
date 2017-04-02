//
//  PictureViewController.swift
//  snap1
//
//  Created by Kamil Wrobel on 4/1/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        
        imageView.backgroundColor = UIColor.clear
        
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    
    

    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        
        imagePicker.allowsEditing = false
        
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }

    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: selectUserSegue, sender: nil)
        
        
    }

    
}
