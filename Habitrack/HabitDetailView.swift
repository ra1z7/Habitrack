//
//  HabitDetailView.swift
//  Habitrack
//
//  Created by Purnaman Rai (College) on 26/09/2025.
//

import SwiftUI

struct HabitDetailView: View {
    var habit: Habit
    
    var body: some View {
        VStack {
            Text(habit.title)
                .font(.title)
            Text(habit.description)
                .font(.title3)
            Text("Completion: \(habit.completition)")
            
            Button("Completed") {
                habit.incrementCompletionCount()
            }
        }
    }
    
    init(for habit: Habit) {
        self.habit = habit
    }
}

#Preview {
    HabitDetailView(for: Habit.samples.first!)
}
