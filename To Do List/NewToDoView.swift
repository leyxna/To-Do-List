//
//  NewToDoView.swift
//  To Do List
//
//  Created by Leyna Phan on 7/18/23.
//

import SwiftUI

struct NewToDoView: View {
    @State var title: String
    @State var isImportant: Bool
    @Binding var toDoItems: [ToDoItem]
    @Binding var showNewTask : Bool
    
    var body: some View {
        ZStack {
            Color(hue: 0.962, saturation: 0.5, brightness: 0.95)
                .ignoresSafeArea()
            VStack {
                Text("Task title:")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                TextField("Enter the task description...", text: $title)
                    .padding()
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(15)
                    .padding()
                
                Toggle(isOn: $isImportant) { Text("Is it important?")
                        .foregroundColor(Color.white)
                } .padding()
                
                Button(action: {
                    self.addTask(title: self.title, isImportant: self.isImportant)
                    self.showNewTask = false
                }) {
                    Text("Add")
                        .padding(.horizontal, 160)
                        .padding(.vertical, 15)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(18)
                        
                
                }
            }
            
        }
    }
    private func addTask(title: String, isImportant: Bool = false) {
            
            let task = ToDoItem(title: title, isImportant: isImportant)
            toDoItems.append(task)
        }
    }


struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title:"", isImportant: false, toDoItems: .constant([]), showNewTask: .constant(true))
    
    }
}

