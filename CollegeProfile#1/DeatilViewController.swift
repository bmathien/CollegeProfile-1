//
//  DeatilViewController.swift
//  CollegeProfile#1
//
//  Created by Mathien on 1/27/16.
//  Copyright © 2016 Mathien. All rights reserved.
//

import UIKit

class DeatilViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    
    var college : College!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myImageView.image = college.image
        nameTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = college.enrollment
    }

    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.enrollment = enrollmentTextField.text!
    }


}
