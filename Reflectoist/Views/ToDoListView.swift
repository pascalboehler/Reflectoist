//
//  ToDoView.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Achievements:")
                List {
                    
                    Text("Item1")
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

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
