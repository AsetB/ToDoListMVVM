//
//  ViewController.swift
//  ToDoListMVVM
//
//  Created by Aset Bakirov on 03.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var viewModel: TaskViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = TaskViewModel { [unowned self] (state) in
            switch state.editingStyle {
            case .addTask(let string):
                textField.text = ""
                break
            case .deleteTask(let indexPath):
                break
            case .toggleTask(let indexPath):
                break
            case .loadTasks(let array):
                break
            case .none:
                break
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.loadTasks()
    }
    
    @IBAction func addTask(_ sender: Any) {
        
        viewModel?.addNewTask(taskName: textField.text!)
    }


}

