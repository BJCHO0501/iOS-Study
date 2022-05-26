//
//  ViewController.swift
//  TODOList
//
//  Created by 조병진 on 2022/05/24.
//

import UIKit

var todoList = [TodoList]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewController: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewController.delegate = self
        tableViewController.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewController.reloadData()
    }
    
    //MARK: - 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    //MARK: - 각 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = todoList[indexPath.row].TodoTitle
        cell.detailTextLabel?.text = todoList[indexPath.row].TodoSubtitle
        return cell
    }
    
    //MARK: - 리스트 삭제 함수
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert {
            
        }
    }
}
