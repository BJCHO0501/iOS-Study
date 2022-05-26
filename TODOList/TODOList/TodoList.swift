//
//  TodoList.swift
//  TODOList
//
//  Created by 조병진 on 2022/05/24.
//

import Foundation

struct TodoList {
    var TodoTitle: String = " "
    var TodoSubtitle: String = " "
    
    init(todoTitle: String, todoSubtitle: String) {
        self.TodoTitle = todoTitle
        self.TodoSubtitle = todoSubtitle
    }
}
