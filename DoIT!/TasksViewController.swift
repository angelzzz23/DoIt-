//
//TasksViewController.swift
//  DoIT!
//
//  Created by Victor Zambrano on 2/11/17.
//  Copyright © 2017 Angelzzz23. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
        
            }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important
        {
            cell.textLabel?.text = "❗️\(task.name)"
        }
        else
        {
            cell.textLabel?.text = task.name
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selectedIndex = indexPath.row

        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    func makeTasks() -> [Task]
    {
        let taskOne = Task()
        taskOne.name = "Walk the Dog"
        taskOne.important = false
        
        let taskTwo = Task()
        taskTwo.name = "Go Running"
        taskTwo.important = false
        
        let taskThree = Task()
        taskThree.name = "Do HW"
        taskThree.important = true
        
        return[taskOne, taskTwo, taskThree]
    }
    
    @IBAction func plusTapped(_ sender: Any)
    {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "addSegue"
        {
        let nextVC = segue.destination as! CreatTaskViewController
        nextVC.previousVC = self
        }
        
        if segue.identifier == "selectTaskSegue"
        {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
             nextVC.previousVC = self
        }
        

    }
    
}

