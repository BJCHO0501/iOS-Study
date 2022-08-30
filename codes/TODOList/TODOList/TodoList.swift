import Foundation

struct TodoList {
    var TodoTitle: String = " "
    var TodoSubtitle: String = " "
    
    init(todoTitle: String, todoSubtitle: String) {
        self.TodoTitle = todoTitle
        self.TodoSubtitle = todoSubtitle
    }
}
