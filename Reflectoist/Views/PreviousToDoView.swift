//
//  PreviousToDoView.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import SwiftUI

struct PreviousToDoView: View {
    var body: some View {
        NavigationView {
            Text("Hello2)")
            .navigationTitle("THE DAY YOU VIEW")
            .navigationBarItems(leading: Button(action: {
                print("Cal")
            }, label: {
                Image(systemName: "calendar")
            }))
        }
    }
}

struct PreviousToDoView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousToDoView()
    }
}
