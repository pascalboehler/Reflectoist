//
//  ToDoListItem.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import SwiftUI

struct ToDoListItem: View {
    var todoItem: ToDoItem
    
    var body: some View {
        HStack {
            Text(todoItem.name)
            Spacer()
            Text(todoItem.dateCompleted.formatted())
                .fontWeight(.light)
                .italic()
        }
    }
}

struct ToDoListItem_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItem(todoItem: ToDoItem())
    }
}
