//
//  AddToDoItemView.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 13.01.23.
//

import SwiftUI

struct AddToDoItemView: View {
    var body: some View {
        VStack{
            // Title section
            ScrollView {
                Text("Hi")
            }
        }
        .navigationBarTitle("Hello")
        .navigationBarItems(trailing: Button(action: {
            print("Hi")
        }, label: {
            Text("Done")
        }))
    }
}

struct AddToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoItemView()
    }
}
