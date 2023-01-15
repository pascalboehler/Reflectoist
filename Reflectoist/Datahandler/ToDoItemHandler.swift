//
//  ToDoItemHandler.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import Foundation

class ToDoItemHandler : ObservableObject {
    @Published var todoList: [ToDoItem]
    
    private var jsonString: String = "[{\"todos\": {\"name\": \"Helloe\"}},{\"todos\": {\"name\": \"Testing\"}}]"
    
    init(jsonString: String = "") {
        self.todoList = MockDataCreator().todoMockData
        self.helloWorld()
    }
    
    func helloWorld() {
        print("Hi")
    }
    
    func readDataToArray() {
        // conv stuff: Date.timeIntervalSince1970.formatted()
        // Currently returns mock data!
        
        
    }
    
    func formatForDatabase() -> String {
        
        
        return "Hi"
    }
}
