import UIKit

var todoList = [TodoList]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewController: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewController.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        saveData()
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
    
    private func saveData() {
        let data = todoList.map {
            [
                "title": $0.TodoTitle,
                "subtitle": $0.TodoSubtitle
            ]
        }
        
        UserDefaults.standard.set(data, forKey: "item")
        UserDefaults.standard.synchronize()
    }
    
    func getData() {
        guard let data = UserDefaults.standard.object(forKey: "item") as? [[String: AnyObject]] else {
            return
        }
            
        todoList = data.map {
            let title = $0["title"] as? String
            let subtitle = $0["subtitle"] as? String
            
            return TodoList(todoTitle: title!, todoSubtitle: subtitle!)
        }
    }
}
