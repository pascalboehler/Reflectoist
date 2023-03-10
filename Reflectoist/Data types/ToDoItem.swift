//
//  ToDoItem.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import Foundation

struct ToDoItem: Identifiable {
    var id: Int?
    var name: String = "Hi"
    var completed: Bool = true
    var dateCompleted: Date = Date(timeIntervalSince1970: 120)
    var dateAdded: Date = Date(timeIntervalSince1970: 120)
}
