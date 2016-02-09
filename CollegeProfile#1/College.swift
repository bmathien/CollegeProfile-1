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
    var website = ""
    
    
    init(Name: String, Location: String, Enrollment: String, Image: UIImage, Website: String)
    {
        super.init()
        name = Name
        location = Location
        enrollment = Enrollment
        image = Image
        website = Website
    }
    
    init(Name: String, Location: String, Enrollment: String, Website: String)
    {
        super.init()
        name = Name
        location = Location
        enrollment = Enrollment
        website = Website
    }
}
