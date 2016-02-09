//
//  DeatilViewController.swift
//  CollegeProfile#1
//
//  Created by Mathien on 1/27/16.
//  Copyright © 2016 Mathien. All rights reserved.
//

import UIKit
import SafariServices

class DeatilViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    
    var college : College!
    let myImagePicker = UIImagePickerController()


    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myImageView.image = college.image
        nameTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = college.enrollment
        websiteTextField.text = college.website
        myImagePicker.delegate = self
        myImagePicker.allowsEditing = true
    }

    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.enrollment = enrollmentTextField.text!
        college.website = websiteTextField.text!
    }

    @IBAction func imageTapped(sender: UITapGestureRecognizer)
    {
        print("tapped")
        let selectedPoint = sender.locationInView(view)

        if CGRectContainsPoint(myImageView.frame, selectedPoint)
        {
            print("Image tapped")
            myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(myImagePicker, animated: true, completion: nil)
        }
    }

    @IBAction func websiteBUttonTapped(sender: AnyObject)
    {
        let myUrl = NSURL(string: "https://" + college.website)
        let svc = SFSafariViewController(URL: myUrl!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        myImagePicker.dismissViewControllerAnimated(true) { () -> Void in
            self.myImageView.image = (info[UIImagePickerControllerEditedImage] as! UIImage)
            self.college.image = (info[UIImagePickerControllerEditedImage] as! UIImage)
        }
    }
}
