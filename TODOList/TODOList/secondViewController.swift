//
//  secondViewController.swift
//  TODOList
//
//  Created by 조병진 on 2022/05/24.
//

import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var contantTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneBarbuttonitemDidTap(_ Button: UIBarButtonItem) {
        let title = titleTextfield.text!
        let contant = contantTextView.text!
        
        let item: TodoList = TodoList(todoTitle: title, todoSubtitle: contant)
        todoList.append(item)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelBarbuttonitemDidTap(_ Button: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
