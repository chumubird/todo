//
//  UserDefaultModel.swift
//  todo
//
//  Created by t2023-m0081 on 2023/09/04.
//

import Foundation

struct UserDefaultModel{
    
    static var userDefaultFunc = UserDefaultModel()
    
    func saveTodoForAlone() {
        UserDefaults.standard.set(ToDoModel.shareToDoModel.todoForAlone, forKey: "todoForAlone") 
    }
    
    func loadTodoForAlone() {
        if let savedTodoForAlone = UserDefaults.standard.array(forKey: "todoForAlone") as? [String] {
            ToDoModel.shareToDoModel.todoForAlone = savedTodoForAlone
        }
    }
    
    func saveTodoForTogether() {
        UserDefaults.standard.set(ToDoModel.shareToDoModel.todoForTogether, forKey: "todoForTogether")
    }
    func loadTodoForTogether() {
        if let savedTodoForTogether = UserDefaults.standard.array(forKey: "todoForTogether") as? [String] {
            ToDoModel.shareToDoModel.todoForTogether = savedTodoForTogether
   
         
        }
    }
 
    func saveDeletedTodo() {
        UserDefaults.standard.set(ToDoModel.shareToDoModel.deletedTodo, forKey: "deletedTodo")
    }
    func loadDeletedTodo() {
        if let saveDeletedTodo = UserDefaults.standard.array(forKey: "deletedTodo") as? [String] {
            ToDoModel.shareToDoModel.deletedTodo = saveDeletedTodo
            
        }
    }
}
