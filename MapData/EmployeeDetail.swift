//
//  EmployeeDetail.swift
//  MapData
//
//  Created by Kristian Secor on 2/11/15.
//  Copyright (c) 2015 Kristian Secor. All rights reserved.
//


import UIKit
import CoreData

class EmployeeDetail: UIViewController {
    
  
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var positionField: UITextField!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    
    var employee: Employees? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if employee != nil {
           nameField.text = employee?.fullName
           positionField.text = employee?.position
        }
    }
    
    @IBAction func done(sender: AnyObject) {
        if employee != nil {
            editEmployee()
        } else {
            createEmployee()
        }
        dismissViewController()
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewController()
    }
    
    func dismissViewController() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func createEmployee() {
        let entityDescription = NSEntityDescription.entityForName("Employees", inManagedObjectContext: managedObjectContext!)
        let employee = Employees(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        employee.fullName = nameField.text
        employee.position = positionField.text
        managedObjectContext?.save(nil)
    }
    
    
    func editEmployee() {
        employee?.fullName = nameField.text
        employee?.position = positionField.text

        managedObjectContext?.save(nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
