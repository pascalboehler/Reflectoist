//
//  ToDoItemHandler.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import Foundation

class ToDoItemHandler {
    var jsonString: String = "[{\"todos\": {\"name\": \"Helloe\"}},{\"todos\": {\"name\": \"Testing\"}}]"
    
    init(jsonString: String = "") {
        helloWorld()
    }
    
    func helloWorld() {
        print("Hi")
    }
    
    func readDataToArray() -> [ToDoItem] {
        
        
        return MockDataCreator().todoMockData;
    }
}
