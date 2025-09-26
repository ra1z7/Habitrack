//
//  AddNewHabit.swift
//  Habitrack
//
//  Created by Purnaman Rai (College) on 26/09/2025.
//

import SwiftUI

struct AddNewHabit: View {
    var habitStore: HabitStore
    
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismissView
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Description", text: $description)
        }
        .navigationTitle("Add New Habit")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismissView()
                }
            }
            
            ToolbarItem(placement: .confirmationAction){
                Button("Add") {
                    habitStore.habits.append(Habit(title: title, description: description))
                    dismissView()
                }
                .disabled(title.isEmpty || description.isEmpty)
            }
        }
    }
    
    init(in habits: HabitStore) {
        self.habitStore = habits
    }
}

#Preview {
    NavigationStack {
        AddNewHabit(in: HabitStore())
    }
}
