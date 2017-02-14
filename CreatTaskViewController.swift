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
   
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @IBAction func addTapped(_ sender: Any)
    {
        //create a task from the outlet info 
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        //add new task to array in previous viewController
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
}
    
}
