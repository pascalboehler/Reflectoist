//
//  ToDoView.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import SwiftUI

struct TodayListView: View {
    var todoItemList: [ToDoItem]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todoItemList) { item in
                        Button(action: {
                            //item.completed = !item.completed
                        }, label: {
                            ToDoListItemView(todoItem: item)
                        })
                    }
                }
            }
            .navigationBarTitle("Today")
            .navigationBarItems(trailing: NavigationLink(destination: {
                    AddToDoItemView()
                }, label: {
                    Image(systemName: "plus")
                })
            )
        }
    }
}

struct TodayListView_Previews: PreviewProvider {
    static var previews: some View {
        TodayListView(todoItemList: MockDataCreator().todoMockData)
    }
}
