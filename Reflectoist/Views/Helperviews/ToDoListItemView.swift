//
//  ToDoListItem.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import SwiftUI

struct ToDoListItemView: View {
    var todoItem: ToDoItem
    
    var body: some View {
        HStack {
            if (todoItem.completed) {
                Image(systemName: "checkmark.circle")
            } else {
                Image(systemName: "circle")
            }
            
            Text(todoItem.name)
            Spacer()
            Text(todoItem.dateCompleted.formatted())
                .fontWeight(.light)
                .italic()
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(todoItem: ToDoItem(completed: true))
    }
}
