//
//  ToDoModel.swift
//  todo
//
//  Created by t2023-m0081 on 2023/09/04.
//

import Foundation


struct ToDoModel {
    static var shareToDoModel = ToDoModel()
    
    var todoForAlone : [String] = []
    var todoForTogether : [String] = []
    var deletedTodo : [String] = []
    
    init() {}
}

