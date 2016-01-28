//
//  College.swift
//  CollegeProfile#1
//
//  Created by Mathien on 1/27/16.
//  Copyright © 2016 Mathien. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = ""
    var location = ""
    var enrollment = ""
    var image = UIImage(named: "default")
    
    
    init(Name: String, Location: String, Enrollment: String, Image: UIImage)
    {
        super.init()
        name = Name
        location = Location
        enrollment = Enrollment
        image = Image
    }
    
    init(Name: String, Location: String, Enrollment: String)
    {
        super.init()
        name = Name
        location = Location
        enrollment = Enrollment
    }
}
