//
//  ToDoView.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import SwiftUI

struct TodayListView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ToDoListItem(todoItem: ToDoItem())
                    ToDoListItem(todoItem: ToDoItem())
                    ToDoListItem(todoItem: ToDoItem())
                    ToDoListItem(todoItem: ToDoItem())
                    ToDoListItem(todoItem: ToDoItem())
                    ToDoListItem(todoItem: ToDoItem())
                    ToDoListItem(todoItem: ToDoItem())
                }
                
            }
            .navigationBarTitle("Today")
            .navigationBarItems(trailing: Button(action: {
                print("Hi")
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct TodayListView_Previews: PreviewProvider {
    static var previews: some View {
        TodayListView()
    }
}
