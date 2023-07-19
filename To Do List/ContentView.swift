//
//  ContentView.swift
//  To Do List
//
//  Created by Leyna Phan on 7/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var toDoItems: [ToDoItem] = []
    @State private var showNewTask = false
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                    .font(.system(size:40))
                    .fontWeight(.black)
                Spacer()
                Button(action: {
                    withAnimation {
                        self.showNewTask = true
                    }
                }) {
                    Text("+")
                        .font(.system(size:30))
                }
            }
            .padding()
            Spacer()
            
            
            
            List {
                ForEach (toDoItems) { toDoItem in if toDoItem.isImportant == true {
                    Text("‼️" + toDoItem.title)
                } else {
                    Text(toDoItem.title)
                }}
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            
            if showNewTask {
                NewToDoView(title: "", isImportant: false, toDoItems: $toDoItems, showNewTask: $showNewTask)
                    .shadow(radius: 2)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
