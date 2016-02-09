//
//  ViewController.swift
//  CollegeProfile#1
//
//  Created by Mathien on 1/27/16.
//  Copyright © 2016 Mathien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var myTableView: UITableView!
    var colleges : [College] = []

    override func viewWillAppear(animated: Bool)
    {
        myTableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        colleges.append(College(Name: "ISU", Location: "Normal, IL", Enrollment: "20,000", Image: UIImage(named: "isu")!, Website: "illinoisstate.edu/"))
        colleges.append(College(Name: "Notre Dame", Location: "Notre Dame, IN", Enrollment: "20,000", Image: UIImage(named: "nd")!, Website: "illinoisstate.edu/"))
        colleges.append(College(Name: "Harper College", Location: "Palatine, IL", Enrollment: "5,000", Image: UIImage(named: "harper")!, Website: "illinoisstate.edu/"))
    }

    @IBAction func editButtonTapped(sender: AnyObject)
    {
        myTableView.editing = !myTableView.editing
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        
        myAlert.addTextFieldWithConfigurationHandler { (nameTF) -> Void in
            nameTF.placeholder = "Add College name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationTF) -> Void in
            locationTF.placeholder = "Add College location"
        }
        myAlert.addTextFieldWithConfigurationHandler { (enrollmentTF) -> Void in
            enrollmentTF.placeholder = "Add College enrollment"
        }
        myAlert.addTextFieldWithConfigurationHandler { (websiteTF) -> Void in
            websiteTF.placeholder = "Add web address"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let collegeName = myAlert.textFields![0]
            let collegeLocale = myAlert.textFields![1]
            let collegeNUmber = myAlert.textFields![2]
            let collegeWeb = myAlert.textFields![3]
            
            self.colleges.append(College(Name: collegeName.text!, Location: collegeLocale.text!, Enrollment: collegeNUmber.text!, Website: collegeWeb.text!))
            self.myTableView.reloadData()
            }
        myAlert.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
        if myTableView.editing == true
        {
            myTableView.editing = !myTableView.editing

        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel!.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].location
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dvc = segue.destinationViewController as! DeatilViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        
        dvc.college = colleges[selectedRow!]
    }

}

