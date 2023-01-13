//
//  MainTabView.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TodayListView(todoItemList: [ToDoItem()])
                .tabItem {
                    Image(systemName: "house")
                    Text("Today")
                }
            PreviousToDoView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
