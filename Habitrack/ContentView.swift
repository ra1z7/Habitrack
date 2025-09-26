//
//  ContentView.swift
//  Habitrack
//
//  Created by Purnaman Rai (College) on 26/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tracker = HabitStore(fillWithSamples: true)
    @State private var showingAddView = false
    
    var body: some View {
        NavigationStack {
            List(tracker.habits, id: \.self) { habit in
                VStack(alignment: .leading) {
                    Text(habit.title)
                        .font(.headline)
                    Text(habit.description)
                }
            }
            .navigationTitle("Habitrack")
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Label("Add New Habit", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                NavigationStack {
                    AddNewHabit(in: tracker)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
