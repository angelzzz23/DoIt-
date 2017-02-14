//
//  CreatTaskViewController.swift
//  DoIT!
//
//  Created by Victor Zambrano on 2/11/17.
//  Copyright © 2017 Angelzzz23. All rights reserved.
//

import UIKit

class CreatTaskViewController: UIViewController {

    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
   
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @IBAction func addTapped(_ sender: Any)
    {
        //create a task from the outlet info 
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let task = Task(context: context) //managedObject manages who has access
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        //pop
        
        navigationController!.popViewController(animated: true)
        
}
    
}
