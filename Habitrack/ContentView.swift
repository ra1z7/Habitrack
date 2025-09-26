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
            List(tracker.habits) { habit in
                NavigationLink(value: habit) {
                    HStack(spacing: 15) {
                        CompletionCountView(for: habit.completition)
                        
                        VStack(alignment: .leading) {
                            Text(habit.title)
                                .font(.headline)
                            Text(habit.description)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                }
            }
            .navigationTitle("Habitrack")
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Label("Add New Habit", systemImage: "plus")
                }
                .tint(.blue)
            }
            .sheet(isPresented: $showingAddView) {
                NavigationStack {
                    AddNewHabit(in: tracker)
                }
            }
            .navigationDestination(for: Habit.self) { selectedHabit in
                HabitDetailView(for: selectedHabit)
            }
        }
    }
}

#Preview {
    ContentView()
}
