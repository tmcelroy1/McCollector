//
//  CollectionAddViewController.swift
//  McCollector
//
//  Created by Tim McElroy1 on 6/29/17.
//  Copyright © 2017 Tim McElroy1. All rights reserved.
//

import UIKit

class CollectionAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var collectionView: UIImageView!
    @IBOutlet weak var descriptTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }

    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func photoTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
       let image =  info[UIImagePickerControllerOriginalImage] as! UIImage
        collectionView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let playbill = Collection(context: context)
        playbill.title = descriptTextField.text
        playbill.image = UIImagePNGRepresentation(collectionView.image!) as! NSData
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    
    

    
}
